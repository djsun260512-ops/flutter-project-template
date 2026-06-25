import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_project_template/app/l10n/app_localizations.dart';
import 'package:flutter_project_template/app/controllers/theme_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final themeController = Get.find<ThemeController>();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.home),
        actions: [
          _buildThemeSwitcher(l10n, themeController),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.home,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 20),
            Text(
              l10n.home,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            const Text('Welcome to the Home Page!'),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSwitcher(AppLocalizations l10n, ThemeController themeController) {
    return Obx(() => PopupMenuButton<ThemeModeOption>(
      icon: Icon(
        themeController.themeMode == ThemeModeOption.dark
            ? Icons.dark_mode
            : themeController.themeMode == ThemeModeOption.light
                ? Icons.light_mode
                : Icons.brightness_auto,
      ),
      onSelected: (ThemeModeOption mode) {
        themeController.setThemeMode(mode);
      },
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<ThemeModeOption>(
          value: ThemeModeOption.light,
          child: Row(
            children: [
              const Icon(Icons.light_mode),
              const SizedBox(width: 8),
              Text(l10n.themeLight),
            ],
          ),
        ),
        PopupMenuItem<ThemeModeOption>(
          value: ThemeModeOption.dark,
          child: Row(
            children: [
              const Icon(Icons.dark_mode),
              const SizedBox(width: 8),
              Text(l10n.themeDark),
            ],
          ),
        ),
        PopupMenuItem<ThemeModeOption>(
          value: ThemeModeOption.system,
          child: Row(
            children: [
              const Icon(Icons.brightness_auto),
              const SizedBox(width: 8),
              Text(l10n.themeSystem),
            ],
          ),
        ),
      ],
    ));
  }
}
