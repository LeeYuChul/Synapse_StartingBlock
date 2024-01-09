import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starting_block/constants/constants.dart';
import 'package:starting_block/screen/manage/screen_manage.dart';

class RoadMapEdit extends StatefulWidget {
  const RoadMapEdit({super.key});

  @override
  RoadMapEditState createState() => RoadMapEditState();
}

class RoadMapEditState extends State<RoadMapEdit> {
  bool _isOrderChanged = false;
  late List<String> _tempRoadmapItems; // 여기에 'late' 추가

  @override
  void initState() {
    super.initState();
    final roadmapModel = Provider.of<RoadMapModel>(context, listen: false);
    _tempRoadmapItems = List<String>.from(roadmapModel.roadmapList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Gaps.v22,
                Text(
                  '로드맵 단계 수정',
                  style: AppTextStyles.h5.copyWith(color: AppColors.black),
                ),
                Gaps.v10,
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RoadMapAdd()),
                  );
                },
                child: SizedBox(
                  height: 32,
                  width: 49,
                  child: Text(
                    '추가',
                    style: AppTextStyles.btn1.copyWith(color: AppColors.g6),
                  ),
                ),
              ),
              Gaps.h4,
              GestureDetector(
                onTap: () {
                  // 여기에 '삭제' 버튼의 로직 추가
                },
                child: SizedBox(
                  height: 32,
                  width: 49,
                  child: Text(
                    '삭제',
                    style: AppTextStyles.btn1.copyWith(color: AppColors.g6),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ReorderableListView(
              children: <Widget>[
                for (final item in _tempRoadmapItems)
                  SizedBox(
                    key: Key(item),
                    height: 48,
                    child: ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 24),
                      title: Text(
                        item,
                        style: AppTextStyles.bd2.copyWith(color: AppColors.g6),
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
                  final item = _tempRoadmapItems.removeAt(oldIndex);
                  _tempRoadmapItems.insert(newIndex, item);
                  _isOrderChanged = true; // 순서 변경 감지
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              right: 24,
              left: 24,
              bottom: 24,
            ),
            child: GestureDetector(
              onTap: _isOrderChanged
                  ? () {
                      Provider.of<RoadMapModel>(context, listen: false)
                          .updateRoadmapList(_tempRoadmapItems);
                      Navigator.pop(context);
                    }
                  : null,
              child: NextContained(
                text: "완료",
                disabled: !_isOrderChanged, // 버튼 활성화 상태 결정
              ),
            ),
          ),
        ],
      ),
    );
  }
}
