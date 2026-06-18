import 'package:flutter/material.dart';
import 'package:flutter_project_template/app/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'routes.dart';
import 'themes.dart';
import 'l10n/app_localizations.dart';
import 'controllers/theme_controller.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    
    return Obx(() => GetMaterialApp(
      title: '',
      onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeController.flutterThemeMode,
      initialRoute: AppRoutes.login,
      getPages: AppRoutes.pages,
      // 全局中间件（对所有路由生效）
      routingCallback: (routing) {
        // 使用全局路由回调实现简单鉴权
        final authController = Get.find<AuthController>();
        if (!authController.isLoggedIn.value && routing?.current != AppRoutes.login) {
          Get.offNamed(AppRoutes.login);
        }
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
    ));
  }
}