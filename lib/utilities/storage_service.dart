import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferences prefs;

  LocalStorageService(this.prefs);

  Future<void> setString(String name, value) async {
    prefs.setString("cudo_$name", value);
  }

  String? getString(String name) {
    return prefs.getString("cudo_$name");
  }

  Future<void> setDouble(String name, value) async {
    prefs.setDouble("cudo_$name", value);
  }

  Future<void> setInt(String name, value) async {
    prefs.setInt("cudo_$name", value);
  }

  int? getInt(String name) {
    return prefs.getInt("cudo_$name");
  }

  double? getDouble(String name) {
    return prefs.getDouble("cudo_$name");
  }
}