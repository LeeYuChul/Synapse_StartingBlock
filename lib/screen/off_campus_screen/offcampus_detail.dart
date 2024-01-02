import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:starting_block/constants/constants.dart';
import 'package:starting_block/screen/manage/screen_manage.dart';
import 'package:starting_block/screen/manage/models/offcampus_detail_model.dart';
import 'package:starting_block/screen/manage/models/offcampus_recommend_model.dart'; // 모델 파일 임포트

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
  String thisID = 'N/A';

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
        (element) => element['id'].toString() == widget.thisID,
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
        thisID = detailData.id;
      }
    });
  }

  Future<List<OffCampusRecommendModel>> loadJsonData() async {
    try {
      String jsonString =
          await rootBundle.loadString('lib/data_manage/outschool_gara.json');
      List<dynamic> jsonData = json.decode(jsonString);
      List<OffCampusRecommendModel> recommendations = jsonData
          .where((item) => item['id'].toString() != widget.thisID)
          .map((item) => OffCampusRecommendModel.fromJson(item))
          .toList();
      recommendations.shuffle();
      return recommendations.take(3).toList(); // 여기서 3개 아이템만 선택
    } catch (e) {
      print('Error loading JSON data: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SaveAppBar(isSaved: true),
      body: SingleChildScrollView(
        // SingleChildScrollView로 감싸기
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OffCampusDetailBody(
              organize: thisOrganize,
              title: thisTitle,
              startDate: thisStartDate,
              endDate: thisEndDate,
              age: thisAge,
              type: thisType,
              link: thisLink,
              thisID: widget.thisID,
            ),
            Container(
              height: 8,
              decoration: const BoxDecoration(color: AppColors.g1),
            ),
            Recommendation(
              futureRecommendations: loadJsonData(),
              thisID: thisID,
            ),
          ],
        ),
      ),
    );
  }
}
