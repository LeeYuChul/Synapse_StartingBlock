// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';

const location = [
  "전체",
  "서울",
  "부산",
  "대구",
  "인천",
  "경기",
  "강원",
  "충북",
  "충남",
  "전북",
  "광주",
  "대전",
  "울산",
  "세종",
  "전남",
  "경북",
  "경남",
  "제주",
];

class ResidenceSheet extends StatefulWidget {
  const ResidenceSheet({super.key});

  @override
  _ResidenceSheetState createState() => _ResidenceSheetState();
}

class _ResidenceSheetState extends State<ResidenceSheet> {
  String selectedEntrepreneur = "전체"; // 선택된 사업자 형태를 저장하는 변수

  void _onEntrepreneurSelected(String residence) {
    setState(() {
      selectedEntrepreneur = residence;
    });
    // 필요한 경우 선택된 사업자 형태를 사용하여 다른 작업을 수행
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: 400,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v24,
          Row(
            children: [
              Gaps.h24,
              Text(
                '지역',
                style: AppTextStyles.st2.copyWith(color: AppColors.g6),
              ),
            ],
          ),
          Gaps.v8,
          Expanded(
            child: ListView.builder(
              itemCount: location.length,
              itemBuilder: (context, index) {
                String residence = location[index];
                return BottomSheetList(
                  thisText: residence,
                  thisColor:
                      selectedEntrepreneur == residence ? AppColors.g1 : null,
                  thisTapAction: () => _onEntrepreneurSelected(residence),
                );
              },
            ),
          ),
          Gaps.v24,
        ],
      ),
    );
  }
}
