import 'package:shared_preferences/shared_preferences.dart';

class BookMarkManager {
  SharedPreferences? prefs;

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<bool> isBookMarked(String id) async {
    await initPrefs(); // prefs 초기화 보장
    final bookMarked = prefs?.getStringList('bookMarked') ?? [];
    return bookMarked.contains(id);
  }

  Future<void> toggleBookMark(String id) async {
    await initPrefs(); // prefs 초기화 보장
    final bookMarked = prefs?.getStringList('bookMarked') ?? [];
    if (bookMarked.contains(id)) {
      bookMarked.remove(id);
    } else {
      bookMarked.add(id);
    }
    await prefs?.setStringList('bookMarked', bookMarked);
  }
}
