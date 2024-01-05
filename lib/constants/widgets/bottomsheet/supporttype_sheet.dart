// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';

const type = [
  "전체",
  "시설/공간/보육",
  "행사/네트워크",
  "융자/금융",
  "판로/해외진출/수출",
  "인력",
  "경영/사업화/창업",
  "기술 개발(R&D)",
  "기타",
];

class SupportTypeSheet extends StatefulWidget {
  const SupportTypeSheet({super.key});

  @override
  _SupportTypeSheetState createState() => _SupportTypeSheetState();
}

class _SupportTypeSheetState extends State<SupportTypeSheet> {
  String selectedSupportType = "전체"; // 선택된 사업자 형태를 저장하는 변수

  void _onSupportTypeSelected(String supporttype) {
    setState(() {
      selectedSupportType = supporttype;
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
                '지원 분야',
                style: AppTextStyles.st2.copyWith(color: AppColors.g6),
              ),
            ],
          ),
          Gaps.v8,
          Expanded(
            child: ListView.builder(
              itemCount: type.length,
              itemBuilder: (context, index) {
                String supporttype = type[index];
                return BottomSheetList(
                  thisText: supporttype,
                  thisColor:
                      selectedSupportType == supporttype ? AppColors.g1 : null,
                  thisTapAction: () => _onSupportTypeSelected(supporttype),
                );
              },
            ),
          ),
          Gaps.v24
        ],
      ),
    );
  }
}
