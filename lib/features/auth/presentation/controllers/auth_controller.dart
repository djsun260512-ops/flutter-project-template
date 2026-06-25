import 'package:get/get.dart';
import '../../data/repositories/auth_repo.dart';
import '../../../../core/storage/storage_service.dart';
import '../../../../app/routes.dart';

class AuthController extends GetxController {
  final AuthRepo _repo = AuthRepo();
  final StorageService _storage = StorageService();

  // 响应式状态
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> performLogin(String username, String password) async {
    isLoading.value = true;
    errorMessage.value = '';
    try {
      // final token = await _repo.login(username, password);
      // await _storage.setToken(token);
      // final authController = Get.find<AuthController>();
      // authController.isLoggedIn.value = true; // 设置登录状态为已登录
      // Get.offNamed(AppRoutes.main); // 登录成功跳转首页
      // 模拟登录成功，直接跳转到主页面
      await Future.delayed(const Duration(seconds: 1));
      await _storage.setToken('mock_token_$username');
      Get.offAllNamed(AppRoutes.main); // 登录成功跳转主页面（带底部导航）
    } catch (e) {
      errorMessage.value = '登录失败：${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}