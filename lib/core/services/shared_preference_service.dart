import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  static late SharedPreferences _preferences;

  Future<void> init() async =>
      _preferences = await SharedPreferences.getInstance();

  Future<void> remove(String key) async => await _preferences.remove(key);

  Future<void> clear() async => await _preferences.clear();

  Future<void> setToken(String value) async =>
      await _preferences.setString('token', value);

  String? getToken() => _preferences.getString('token');

  Future<void> removeToken() async => await _preferences.remove('token');
}
