import 'package:get/get.dart';
import '../features/auth/presentation/pages/login_page.dart';
// import '../features/auth/presentation/pages/home_page.dart';
class AppRoutes {
  static const String login = '/login';
  static const String home = '/home';

  static List<GetPage> pages = [
    GetPage(name: login, page: () => const LoginPage()),
    // GetPage(name: home, page: () => const HomePage()),
  ];
}