import 'package:get/get.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../app/widgets/bottom_nav_widget.dart';

class AppRoutes {
  static const String login = '/login';
  static const String main = '/main';

  static List<GetPage> pages = [
    GetPage(name: login, page: () => const LoginPage()),
    GetPage(name: main, page: () => const BottomNavWidget()),
  ];
}