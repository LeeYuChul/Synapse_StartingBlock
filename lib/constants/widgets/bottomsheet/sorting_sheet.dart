// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';

const sortlist = [
  "최신순",
  "로드맵에 저장 많은 순",
];

class SotringSheet extends StatefulWidget {
  const SotringSheet({super.key});

  @override
  _SortingSheetState createState() => _SortingSheetState();
}

class _SortingSheetState extends State<SotringSheet> {
  String selectedSortValue = "최신순"; // 선택된 사업자 형태를 저장하는 변수

  void _onSortingSelected(String sortvalue) {
    setState(() {
      selectedSortValue = sortvalue;
    });
    // 필요한 경우 선택된 사업자 형태를 사용하여 다른 작업을 수행
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v24,
          Row(
            children: [
              Gaps.h24,
              Text(
                '정렬',
                style: AppTextStyles.st2.copyWith(color: AppColors.g6),
              ),
            ],
          ),
          Gaps.v8,
          Expanded(
            child: ListView.builder(
              itemCount: sortlist.length,
              itemBuilder: (context, index) {
                String sortvalue = sortlist[index];
                return BottomSheetList(
                  thisText: sortvalue,
                  thisColor:
                      selectedSortValue == sortvalue ? AppColors.g1 : null,
                  thisTapAction: () => _onSortingSelected(sortvalue),
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
