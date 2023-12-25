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
        scaffoldBackgroundColor: AppColors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.black,
          foregroundColor: AppColors.white,
          elevation: 10,
          titleTextStyle: TextStyle(
            color: Colors.blue,
            fontSize: Sizes.size8,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const BirthdayScreen(),
    );
  }
}
