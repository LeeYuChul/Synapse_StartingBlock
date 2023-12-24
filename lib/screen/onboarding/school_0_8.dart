import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';
import 'package:starting_block/screen/manage/screen_manage.dart'; // schoolList가 여기에 정의되어 있다고 가정

class SchoolScreen extends StatefulWidget {
  const SchoolScreen({super.key});

  @override
  State<SchoolScreen> createState() => _SchoolScreenState();
}

class _SchoolScreenState extends State<SchoolScreen> {
  final TextEditingController _schoolInfoController = TextEditingController();
  List<String> filteredSchoolList = [];

  String _schoolInfo = "";

  @override
  void initState() {
    super.initState();
    _schoolInfoController.addListener(() {
      setState(() {
        _schoolInfo = _schoolInfoController.text;
        filterSearchResults(_schoolInfo);
      });
    });

    filteredSchoolList =
        List.from(schoolList); // schoolList를 screen_manage.dart에서 불러온다고 가정
  }

  void filterSearchResults(String query) {
    if (query.isNotEmpty) {
      List<String> tempList = schoolList
          .where((school) => school.toLowerCase().contains(query.toLowerCase()))
          .toList();
      setState(() {
        filteredSchoolList = tempList;
      });
    } else {
      setState(() {
        filteredSchoolList = List.from(schoolList);
      });
    }
  }

  void _onNextTap() {
    if (_schoolInfo.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EnterprenutScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Image(image: AppImages.back),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.h12,
                const Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.g2,
                    ),
                    Gaps.h4,
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.g2,
                    ),
                    Gaps.h4,
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.g2,
                    ),
                    Gaps.h4,
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.g2,
                    ),
                    Gaps.h4,
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.blue,
                    ),
                    Gaps.h4,
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.g2,
                    ),
                  ],
                ),
                Gaps.v36,
                Text(
                  "대학교(원)를 선택해주세요",
                  style: AppTextStyles.h5.copyWith(color: AppColors.g6),
                ),
                Gaps.v10,
                Text(
                  "현재 일부 대학의 교내 지원사업을 제공해 드립니다",
                  style: AppTextStyles.bd6.copyWith(color: AppColors.g6),
                ),
                Gaps.v32,
                TextField(
                  controller: _schoolInfoController,
                  decoration: const InputDecoration(hintText: "학교명을 입력해주세요"),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredSchoolList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredSchoolList[index]),
                      );
                    },
                  ),
                ),
                const Spacer(), // 나머지 공간을 채우는 위젯
                Padding(
                  padding: const EdgeInsets.only(bottom: 72),
                  child: GestureDetector(
                    onTap: _onNextTap,
                    child: NextContained(
                      text: "다음",
                      disabled: _schoolInfo.isEmpty,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
