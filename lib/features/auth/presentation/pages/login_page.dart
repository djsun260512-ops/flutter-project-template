import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/login_button.dart';
import '../controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController controller = Get.put(AuthController());
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              onChanged: (v) {
                setState(() {
                  password = v;
                });
              },
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : LoginButton(onTap: () => controller.performLogin(username, password))),
            const SizedBox(height: 10),
            Obx(() => Text(controller.errorMessage.value, style: const TextStyle(color: Colors.red))),
          ],
        ),
      ),
    );
  }
}