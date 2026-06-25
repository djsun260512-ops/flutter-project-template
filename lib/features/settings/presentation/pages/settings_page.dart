import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_project_template/app/l10n/app_localizations.dart';
import 'package:flutter_project_template/app/controllers/theme_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final themeController = Get.find<ThemeController>();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.settings),
      ),
      body: ListView(
        children: [
          Obx(() => ListTile(
            leading: const Icon(Icons.brightness_6),
            title: Text(l10n.themeSettings),
            subtitle: Text(_getThemeModeText(l10n, themeController.themeMode)),
            onTap: () {
              _showThemeDialog(context, l10n, themeController);
            },
          )),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text(l10n.accountSettings),
            subtitle: const Text('Manage your account'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text(l10n.notificationSettings),
            subtitle: const Text('Notification preferences'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(l10n.about),
            subtitle: const Text('App version 1.0.0'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  String _getThemeModeText(AppLocalizations l10n, ThemeModeOption mode) {
    switch (mode) {
      case ThemeModeOption.light:
        return l10n.themeLight;
      case ThemeModeOption.dark:
        return l10n.themeDark;
      case ThemeModeOption.system:
        return l10n.themeSystem;
    }
  }

  void _showThemeDialog(BuildContext context, AppLocalizations l10n, ThemeController themeController) {
    Get.dialog(
      AlertDialog(
        title: Text(l10n.selectTheme),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ThemeModeOption.values.map((mode) {
            return Obx(() => RadioListTile<ThemeModeOption>(
              title: Text(_getThemeModeText(l10n, mode)),
              value: mode,
              groupValue: themeController.themeMode,
              onChanged: (ThemeModeOption? value) {
                if (value != null) {
                  themeController.setThemeMode(value);
                  Get.back();
                }
              },
            ));
          }).toList(),
        ),
      ),
    );
  }
}
