import 'package:flutter/material.dart';
import 'app/app_widget.dart';
import 'core/storage/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService().init(); // 初始化存储
  runApp(const AppWidget());
}