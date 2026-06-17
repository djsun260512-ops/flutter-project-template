import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  late SharedPreferences _prefs;

  StorageService._internal();

  // 在 main 中调用初始化
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> setToken(String token) => _prefs.setString('access_token', token);
  String? getToken() => _prefs.getString('access_token');
  Future<void> clear() => _prefs.clear();
}