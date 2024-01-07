import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';

class RoadmapHome extends StatefulWidget {
  const RoadmapHome({super.key});

  @override
  State<RoadmapHome> createState() => _RoadmapHomeState();
}

class _RoadmapHomeState extends State<RoadmapHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: TextButton(
              onPressed: () {},
              child: Text(
                '단계 편집',
                style: AppTextStyles.btn1.copyWith(color: AppColors.g4),
              ),
            ),
          ),
        ],
        bottom: const PreferredSize(
            preferredSize: Size.fromHeight(54), child: Row()),
      ),
      body: const Column(),
    );
  }
}
