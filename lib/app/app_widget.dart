import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'routes.dart';
import 'themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Your App',
      theme: AppTheme.light,
      initialRoute: AppRoutes.login, // 未登录时跳登录页
      getPages: AppRoutes.pages,
      debugShowCheckedModeBanner: false,
    );
  }
}