import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';
import 'package:starting_block/screen/manage/screen_manage.dart'; // 로드맵 데이터를 여기서 불러옴

class RoadmapScreen extends StatefulWidget {
  const RoadmapScreen({super.key});

  @override
  State<RoadmapScreen> createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends State<RoadmapScreen> {
  void _onNextTap() {
    // 다음 탭 로직 구현 (필요한 경우)
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image(image: AppImages.back),
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v12,
                const Row(
                  children: [
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.g2,
                    ),
                    Gaps.h4,
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.g2,
                    ),
                    Gaps.h4,
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.g2,
                    ),
                    Gaps.h4,
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.g2,
                    ),
                    Gaps.h4,
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.g2,
                    ),
                    Gaps.h4,
                    Icon(
                      Icons.circle,
                      size: Sizes.size8,
                      color: AppColors.blue,
                    ),
                  ],
                ),
                Gaps.v36,
                Text(
                  "로드맵을 설정해보세요",
                  style: AppTextStyles.h5.copyWith(color: AppColors.g6),
                ),
                Gaps.v10,
                Text(
                  "본인에게 맞는 창업 로드맵을 설정할 수 있습니다",
                  style: AppTextStyles.bd6.copyWith(color: AppColors.g6),
                ),
                Gaps.v32,
                Expanded(
                  child: ReorderableListView(
                    children: <Widget>[
                      for (final item
                          in roadmapItems) // roadmapItems는 screen_manage.dart에서 정의된 것으로 가정
                        SizedBox(
                          key: Key(item),
                          height: 48, // 여기에서 높이를 지정합니다
                          child: ListTile(
                            title: Text(
                              item,
                              style: AppTextStyles.bd2
                                  .copyWith(color: AppColors.g6),
                            ),
                            trailing: Image(image: AppImages.sort_actived),
                          ),
                        ),
                    ],
                    onReorder: (int oldIndex, int newIndex) {
                      setState(() {
                        if (newIndex > oldIndex) {
                          newIndex -= 1;
                        }
                        final item = roadmapItems.removeAt(oldIndex);
                        roadmapItems.insert(newIndex, item);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 72),
                  child: GestureDetector(
                    onTap: _onNextTap,
                    child: const NextContained(
                      text: "시작하기",
                      disabled: false,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
