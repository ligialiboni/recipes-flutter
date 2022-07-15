import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/widgets/rounded_button.dart';
import 'package:flutter_application_1/pages/signin_page.dart';
import 'package:flutter_application_1/pages/signup_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/panela-removebg-preview.png',
                    height: 430.0,
                  ),
                ),
              ],
            ),
            Container(
              height: 330.0,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                left: 32,
                right: 32,
                bottom: 32,
              ),
              padding: EdgeInsets.symmetric(vertical: 28.0),
              decoration: BoxDecoration(
                  color: kDarkColor,
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 6),
                      blurRadius: 8.0,
                    )
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/icons/dotted.png',
                      scale: 3,
                      color: Colors.white70,
                    ),
                    SizedBox(
                      height: 22.0,
                    ),
                    Text(
                      "Simplify your cooking plan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        color: kLightFontColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "No more confused about \nyour meal menu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: kDarkGreyFontColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
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
                    SizedBox(
                      height: 14.0,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
