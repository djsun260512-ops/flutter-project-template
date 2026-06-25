import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_project_template/app/l10n/app_localizations.dart';
import 'package:flutter_project_template/app/controllers/bottom_nav_controller.dart';
import 'package:flutter_project_template/features/home/presentation/pages/home_page.dart';
import 'package:flutter_project_template/features/settings/presentation/pages/settings_page.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = Get.put(BottomNavController());
    
    final pages = [
      const HomePage(),
      const SettingsPage(),
    ];

    return Obx(() => Scaffold(
      body: IndexedStack(
        index: controller.currentIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: controller.currentIndex,
        onDestinationSelected: (index) => controller.changeTab(index),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home),
            label: l10n.home,
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings_outlined),
            selectedIcon: const Icon(Icons.settings),
            label: l10n.settings,
          ),
        ],
      ),
    ));
  }
}
