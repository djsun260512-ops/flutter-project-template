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
      final token = await _repo.login(username, password);
      await _storage.setToken(token);
      Get.offNamed(AppRoutes.home); // 登录成功跳转首页
    } catch (e) {
      errorMessage.value = '登录失败：${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }
}