import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';
import 'package:starting_block/screen/manage/screen_manage.dart';

class OffCampusHome extends StatefulWidget {
  const OffCampusHome({super.key});

  @override
  State<OffCampusHome> createState() => _OffCampusHomeState();
}

class _OffCampusHomeState extends State<OffCampusHome> {
  String dropdownValue = '정렬'; // 선택된 옵션을 저장하는 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v12,
            Text('교외 지원 사업',
                style: AppTextStyles.st1.copyWith(color: AppColors.g6)),
            Gaps.v24,
            Container(
              height: 32, //변경필요
              color: AppColors.g2,
            ),
            Gaps.v12,
            Container(
              height: 32,
              decoration: const BoxDecoration(
                border: BorderDirectional(
                  top: BorderSide(width: 2, color: AppColors.g1),
                  bottom: BorderSide(width: 2, color: AppColors.g1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '24개의 공고',
                    style: AppTextStyles.bd6.copyWith(color: AppColors.g4),
                  ),
                  const Spacer(), // 왼쪽 텍스트와 오른쪽 버튼 사이의 공간을 만듦
                  PopupMenuButton<String>(
                    onSelected: (String value) {
                      setState(() {
                        dropdownValue = value; // 사용자가 선택한 값을 저장
                      });
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        const PopupMenuItem(
                          value: '최신순',
                          child: Text('최신순'),
                        ),
                        const PopupMenuItem(
                          value: '오래된 순',
                          child: Text('오래된 순'),
                        ),
                        const PopupMenuItem(
                          value: '찜 많은 순',
                          child: Text('찜 많은 순'),
                        ),
                      ];
                    },
                    child: Row(
                      children: [
                        Text(
                          dropdownValue,
                          style: const TextStyle(
                              fontFamily: 'pretendard',
                              fontSize: 14,
                              color: AppColors.g4),
                        ), // 현재 선택된 값으로 텍스트 업데이트
                        Image(image: AppImages.down), // 버튼의 아이콘
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
