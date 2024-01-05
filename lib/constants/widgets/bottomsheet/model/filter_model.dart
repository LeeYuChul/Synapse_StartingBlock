import 'package:flutter/foundation.dart';

class FilterModel extends ChangeNotifier {
  String _selectedSupportType = "전체";
  String _selectedResidence = "전체";
  String _selectedEntrepreneur = "전체";

  // Getter 메서드를 사용하여 변수의 값을 읽을 수 있게 합니다.
  String get selectedSupportType => _selectedSupportType;
  String get selectedResidence => _selectedResidence;
  String get selectedEntrepreneur => _selectedEntrepreneur;

  // Setter 메서드를 사용하여 변수의 값을 변경하고, notifyListeners()를 호출합니다.
  void setSelectedSupportType(String newValue) {
    _selectedSupportType = newValue;
    notifyListeners();
    print('지원유형 변경사항: $_selectedSupportType');
  }

  void setSelectedResidence(String newValue) {
    _selectedResidence = newValue;
    notifyListeners();
    print('지역 변경사항: $_selectedResidence');
  }

  void setSelectedEntrepreneur(String newValue) {
    _selectedEntrepreneur = newValue;
    notifyListeners();
    print('사업자 형태 변경사항: $_selectedEntrepreneur');
  }

  // 모든 선택 사항을 "전체"로 초기화하는 메서드
  void resetFilters() {
    _selectedSupportType = "전체";
    _selectedResidence = "전체";
    _selectedEntrepreneur = "전체";
    notifyListeners();
    print('필터 초기화');
  }
}
