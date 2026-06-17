import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/app_widget.dart';
import 'core/storage/storage_service.dart';
import 'app/controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService().init();
  Get.put(ThemeController());
  runApp(const AppWidget());
}