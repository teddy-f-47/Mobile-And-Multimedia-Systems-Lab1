import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static SharedPreferences? _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Storage() {
    init();
  }

  void putSaveDataString(String key, String value) {
    if (_prefs != null) _prefs!.setString(key, value);
  }

  String getSaveDataString(String key) {
    return _prefs == null ? '' : _prefs!.getString(key) ?? '';
  }
}
