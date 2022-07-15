import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/rounded_button.dart';
import 'package:flutter_application_1/pages/signin_page.dart';
import 'package:flutter_application_1/pages/signup_page.dart';

class LoginRegisterButtons extends StatelessWidget {
  const LoginRegisterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          RoundedButton(
              label: "SIGN IN",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInScreen()),
                    (route) => false);
              }),
          const SizedBox(
            height: 10,
          ),
          RoundedButton(
              label: "SIGN UP",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpScreen()),
                    (route) => false);
              }),
        ],
      ),
    );
  }
}
