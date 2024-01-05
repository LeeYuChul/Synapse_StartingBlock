// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';

const enterpreneur = [
  "전체",
  "예비창업자",
  "1년미만",
  "2년미만",
  "3년미만",
  "5년미만",
  "7년미만",
  "10년미만",
];

class EnterpreneurSheet extends StatefulWidget {
  final String selectedEntrepreneur;
  final Function(String) onEntrepreneurSelected;

  const EnterpreneurSheet({
    super.key,
    required this.selectedEntrepreneur,
    required this.onEntrepreneurSelected,
  });

  @override
  _EnterpreneurSheetState createState() => _EnterpreneurSheetState();
}

class _EnterpreneurSheetState extends State<EnterpreneurSheet> {
  late String selectedEntrepreneur;

  @override
  void initState() {
    super.initState();
    selectedEntrepreneur = widget.selectedEntrepreneur; // 초기 선택된 항목 설정
  }

  void _onEntrepreneurSelected(String entrepreneur) {
    setState(() {
      selectedEntrepreneur = entrepreneur;
    });
    Navigator.pop(context, entrepreneur);
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
                '사업자 형태',
                style: AppTextStyles.st2.copyWith(color: AppColors.g6),
              ),
            ],
          ),
          Gaps.v8,
          Expanded(
            child: ListView.builder(
              itemCount: enterpreneur.length,
              itemBuilder: (context, index) {
                String entrepreneur = enterpreneur[index];
                return BottomSheetList(
                  thisText: entrepreneur,
                  thisColor: selectedEntrepreneur == entrepreneur
                      ? AppColors.g1
                      : null,
                  thisTapAction: () => _onEntrepreneurSelected(entrepreneur),
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
