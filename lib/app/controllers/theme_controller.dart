import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../themes.dart';
import '../../core/storage/storage_service.dart';

enum ThemeModeOption {
  light,
  dark,
  system,
}

class ThemeController extends GetxController {
  static ThemeController get to => Get.find<ThemeController>();

  final Rx<ThemeModeOption> _themeMode = ThemeModeOption.system.obs;
  ThemeModeOption get themeMode => _themeMode.value;

  ThemeMode get flutterThemeMode {
    switch (_themeMode.value) {
      case ThemeModeOption.light:
        return ThemeMode.light;
      case ThemeModeOption.dark:
        return ThemeMode.dark;
      case ThemeModeOption.system:
        return ThemeMode.system;
    }
  }

  ThemeData get currentTheme {
    switch (_themeMode.value) {
      case ThemeModeOption.light:
        return AppTheme.light;
      case ThemeModeOption.dark:
        return AppTheme.dark;
      case ThemeModeOption.system:
        return Get.theme.brightness == Brightness.light ? AppTheme.light : AppTheme.dark;
    }
  }

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final savedTheme = StorageService().getThemeMode();
    if (savedTheme != null) {
      _themeMode.value = ThemeModeOption.values.firstWhere(
        (e) => e.name == savedTheme,
        orElse: () => ThemeModeOption.system,
      );
    }
  }

  Future<void> setThemeMode(ThemeModeOption mode) async {
    _themeMode.value = mode;
    await StorageService().setThemeMode(mode.name);
    Get.changeThemeMode(flutterThemeMode);
  }

  void toggleTheme() {
    final nextMode = _themeMode.value == ThemeModeOption.light
        ? ThemeModeOption.dark
        : _themeMode.value == ThemeModeOption.dark
            ? ThemeModeOption.system
            : ThemeModeOption.light;
    setThemeMode(nextMode);
  }
}
