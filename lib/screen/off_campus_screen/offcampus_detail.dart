import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:starting_block/constants/constants.dart';
import 'package:starting_block/screen/manage/screen_manage.dart';
import 'package:starting_block/screen/manage/models/offcampus_detail_model.dart';

class OffCampusDetail extends StatefulWidget {
  final String thisID;

  const OffCampusDetail({
    super.key,
    required this.thisID,
  });

  @override
  State<OffCampusDetail> createState() => _OffCampusDetailState();
}

class _OffCampusDetailState extends State<OffCampusDetail> {
  String thisOrganize = 'N/A';
  String thisTitle = 'N/A';
  String thisStartDate = 'N/A';
  String thisEndDate = 'N/A';
  String thisAge = 'N/A';
  String thisType = 'N/A';
  String thisLink = 'N/A';

  @override
  void initState() {
    super.initState();
    loadoffCampusDetailData();
  }

  Future<void> loadoffCampusDetailData() async {
    String jsonString =
        await rootBundle.loadString('lib/data_manage/outschool_gara.json');
    List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      var detailJson = jsonData.firstWhere(
        (element) => element['id'] == widget.thisID,
        orElse: () => null,
      );
      if (detailJson != null) {
        var detailData = OffCampusDetailModel.fromJson(detailJson);
        thisOrganize = detailData.organize;
        thisTitle = detailData.title;
        thisStartDate = detailData.startDate;
        thisEndDate = detailData.endDate;
        thisAge = detailData.age;
        thisType = detailData.type;
        thisLink = detailData.link;
      }
    });
  }

  // void _openWebView(String url) {
  //   Navigator.of(context).push(MaterialPageRoute(
  //     builder: (context) => WebViewScreen(url: url),
  //   ));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SaveAppBar(
        isSaved: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v16,
            Row(
              children: [
                OrganizeChip(text: thisOrganize),
                const Spacer(),
              ],
            ),
            Gaps.v16,
            Text(
              thisTitle,
              style: AppTextStyles.st1.copyWith(color: AppColors.black),
            ),
            Gaps.v8,
            Text(
              '등록일 $thisStartDate',
              style: AppTextStyles.bd4.copyWith(color: AppColors.g4),
            ),
            Text(
              '마감일 $thisEndDate',
              style: AppTextStyles.bd4.copyWith(color: AppColors.g4),
            ),
            Gaps.v12,
            const CustomDivider(),
            Gaps.v16,
            Text('지원 대상',
                style: AppTextStyles.bd5.copyWith(color: AppColors.g4)),
            Gaps.v4,
            Text(thisAge,
                style: AppTextStyles.bd2.copyWith(color: AppColors.g6)),
            Gaps.v20,
            Text('지원 유형',
                style: AppTextStyles.bd5.copyWith(color: AppColors.g4)),
            Gaps.v4,
            Text(thisType,
                style: AppTextStyles.bd2.copyWith(color: AppColors.g6)),
            Gaps.v20,
            Text('지원 혜택',
                style: AppTextStyles.bd5.copyWith(color: AppColors.g4)),
            Gaps.v4,
            Text('여기는 아직 데이터 없음', //수정필요
                style: AppTextStyles.bd2.copyWith(color: AppColors.g6)),
            Gaps.v40,
            const Row(
              children: [
                DeatailContainButton(
                  filledcolor: AppColors.white,
                  text: '질문하기 24',
                  textcolor: AppColors.bluedark,
                  onTapAction: null,
                ),
                Gaps.h8,
                DeatailContainButton(
                  filledcolor: AppColors.bluedark,
                  text: '자세히 보기',
                  textcolor: AppColors.white,
                  onTapAction: null,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
