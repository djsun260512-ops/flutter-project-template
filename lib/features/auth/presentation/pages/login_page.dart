import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/login_button.dart';
import '../controllers/auth_controller.dart';
import 'package:flutter_project_template/app/l10n/app_localizations.dart';
import 'package:flutter_project_template/app/controllers/theme_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController controller = Get.put(AuthController());
  final ThemeController themeController = Get.find<ThemeController>();
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          _buildThemeSwitcher(l10n),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (v) {
                setState(() {
                  username = v;
                });
              },
              decoration: InputDecoration(labelText: l10n.username),
            ),
            TextField(
              onChanged: (v) {
                setState(() {
                  password = v;
                });
              },
              obscureText: true,
              decoration: InputDecoration(labelText: l10n.password),
            ),
            const SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : LoginButton(onTap: () => controller.performLogin(username, password))),
            const SizedBox(height: 10),
            Obx(() => Text(
              controller.errorMessage.value.isNotEmpty 
                  ? l10n.loginFailed(controller.errorMessage.value) 
                  : '', 
              style: const TextStyle(color: Colors.red),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSwitcher(AppLocalizations l10n) {
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