import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app_widget.dart';
import 'core/storage/storage_service.dart';
import 'app/controllers/theme_controller.dart';
import 'app/controllers/app_auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print('Initializing storage service.......................');
  await StorageService().init();
  print('Storage service initialized successfully.=====================');
  Get.put(ThemeController());
  Get.put(AppAuthController());
  print('Starting app.............................................');
  runApp(const AppWidget());
}