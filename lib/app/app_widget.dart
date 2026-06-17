import 'package:flutter/material.dart';
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
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
    ));
  }
}