import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';
import 'package:starting_block/screen/manage/screen_manage.dart';

void main() {
  runApp(const StartingBlock());
}

class StartingBlock extends StatelessWidget {
  const StartingBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.blue,
            fontSize: Sizes.size8,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
            // 포커스를 받지 않았을 때의 밑줄 색상
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.g2),
            ),
            // 포커스를 받았을 때의 밑줄 색상
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.g2),
            ),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.activered))),
      ),
      home: const NickNameScreen(),
    );
  }
}
