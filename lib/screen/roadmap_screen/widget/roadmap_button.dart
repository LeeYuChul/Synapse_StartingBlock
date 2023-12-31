import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starting_block/constants/constants.dart';
import 'package:starting_block/screen/manage/screen_manage.dart';

class RoadMapList extends StatefulWidget {
  const RoadMapList({super.key});

  @override
  State<RoadMapList> createState() => _RoadMapListState();
}

class _RoadMapListState extends State<RoadMapList> {
  int? selectedRoadmapIndex; // 선택된 리스트 항목의 인덱스
  String? selectedRoadmapText; // 선택된 항목의 텍스트

  @override
  Widget build(BuildContext context) {
    final roadmapItems = Provider.of<RoadMapModel>(context).roadmapList;

    // 초기 선택된 항목을 설정합니다.
    if (selectedRoadmapText == null && roadmapItems.isNotEmpty) {
      selectedRoadmapText = roadmapItems[0];
    }

    void roadMapTap(BuildContext context) async {
      await showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setStateModal) {
              return Container(
                color: AppColors.white,
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Gaps.v18,
                    Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          height: 32,
                          width: 76,
                          child: Text(
                            '단계 편집',
                            style: AppTextStyles.btn1
                                .copyWith(color: AppColors.g6),
                          ),
                        ),
                        Gaps.h12,
                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: roadmapItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          String roadmapList = roadmapItems[index];
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setStateModal(() {
                                selectedRoadmapIndex = index;
                              });
                              setState(() {
                                selectedRoadmapText = roadmapItems[index];
                              });
                            },
                            child: Container(
                              height: 48,
                              color: selectedRoadmapIndex == index
                                  ? AppColors.g1
                                  : AppColors.white,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    roadmapList,
                                    style: AppTextStyles.bd2
                                        .copyWith(color: AppColors.g6),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
    }

    return GestureDetector(
      onTap: () => roadMapTap(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selectedRoadmapText ?? '', // 선택된 항목의 텍스트 또는 기본 텍스트 표시
            style: AppTextStyles.h5.copyWith(color: AppColors.white),
          ),
          Gaps.h6,
          Image(image: AppImages.roadmap_downarrow),
        ],
      ),
    );
  }
}
