import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RoadMapModel extends ChangeNotifier {
  List<String> _roadmapList = [];

  List<String> get roadmapList => _roadmapList;

  RoadMapModel() {
    _loadRoadmapList();
  }

  Future<void> _loadRoadmapList() async {
    final prefs = await SharedPreferences.getInstance();
    String? roadmapListString = prefs.getString('roadmapList');
    if (roadmapListString != null) {
      _roadmapList = List<String>.from(json.decode(roadmapListString));
      notifyListeners(); // 변경 사항을 리스너들에게 알립니다.
    }
  }
}
