import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  late SharedPreferences _prefs;
  @override
  Future<void> onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    checkLoginStatus();
  }

  Future<void> checkLoginStatus()  async {
    isLoggedIn.value = _prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> login()  async {
     _prefs.setBool('isLoggedIn', true);
    isLoggedIn.value = true;
  }

  Future<void> logout()  async {
     _prefs.setBool('isLoggedIn', false);
    isLoggedIn.value = false;
  }
}