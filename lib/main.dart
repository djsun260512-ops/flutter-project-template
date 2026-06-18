import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app_widget.dart';
import 'app/controllers/auth_controller.dart';
import 'core/storage/storage_service.dart';
import 'app/controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService().init();
  Get.put(ThemeController());
  Get.put(AuthController());
  runApp(const AppWidget());
}