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

    filteredSchoolList = List.from(schoolList);
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

  void _onSchoolTap(String selectedSchool) {
    setState(() {
      _schoolInfoController.text = selectedSchool;
      _schoolInfo = selectedSchool;
      filteredSchoolList = List.from(schoolList);
    });
  }

  void _onNextTap() {
    if (_schoolInfo.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const RoadmapScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
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
                Gaps.v12,
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
                TextField(
                  controller: _schoolInfoController,
                  decoration: const InputDecoration(hintText: "학교명을 입력해주세요"),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: filteredSchoolList.length > 3
                        ? 3
                        : filteredSchoolList.length, // 최대 3개만 표시
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredSchoolList[index]),
                        onTap: () => _onSchoolTap(filteredSchoolList[index]),
                      );
                    },
                  ),
                ),
                const Spacer(),
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
