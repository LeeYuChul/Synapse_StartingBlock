// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';

class InputChipsDelete extends StatelessWidget {
  final thisIcon, deleteTap, chipTap;
  final String text;

  const InputChipsDelete({
    super.key,
    required this.thisIcon,
    required this.text,
    required this.deleteTap,
    required this.chipTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: chipTap,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(46),
          border: Border.all(color: AppColors.g3, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.h12,
            Text(
              text,
              style: AppTextStyles.btn1.copyWith(
                color: AppColors.g5,
              ),
            ),
            Gaps.h4,
            GestureDetector(
              onTap: deleteTap,
              child: Image(image: thisIcon),
            ),
            Gaps.h8,
          ],
        ),
      ),
    );
  }
}

class InputChupsSharp extends StatelessWidget {
  final String text;
  final chipTap;

  const InputChupsSharp({
    super.key,
    required this.text,
    this.chipTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: chipTap,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(46),
          border: Border.all(color: AppColors.g3, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gaps.h12,
            Text(
              '#$text',
              style: AppTextStyles.btn1.copyWith(
                color: AppColors.g5,
              ),
            ),
            Gaps.h12,
          ],
        ),
      ),
    );
  }
}
