import 'package:dukaan_uc_1/screens/init_screen.dart';
import 'package:flutter/material.dart';

class LoginSuccessScreen extends StatelessWidget {
  static String routeName = "/login_success";

  const LoginSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the next page after 1.3 seconds
    Future.delayed(const Duration(milliseconds: 1300), () {
      Navigator.popAndPushNamed(context, InitScreen.routeName);
    });

    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Login Success"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/success.png",
              height: MediaQuery.of(context).size.height * 0.4, // 40%
            ),
            const SizedBox(height: 16),
            const Text(
              "Login Success",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
