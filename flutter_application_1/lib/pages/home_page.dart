import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/pages/welcome_page.dart';
import 'package:flutter_application_1/repository/services/authentication_service.dart';
import 'package:flutter_application_1/widgets/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePageView extends StatelessWidget {
  String userEmail = "";
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(
            top: 0.0,
            bottom: 0.0,
            left: 32.0,
            right: 32.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'Hi, ${AuthenticationService().getUserName() ?? ""}',
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        color: kLightFontColor,
                      ),
                    ),
                    TextSpan(
                      text: '\nReady to cook?',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: kDarkGreyFontColor,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  AuthenticationService().signOut().then((value) async {
                    await FirebaseAuth.instance.signOut();
                    await GoogleSignIn().signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WelcomeScreen()),
                        (route) => false);
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    // color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        'assets/icons/exit.png',
                        height: 45,
                        width: 25,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        RandomCardWidget(),
        flexibleText(
          text: 'Category',
          fontSize: 28,
          textColor: kLightFontColor,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topLeft,
        ),
        CategoryCardListWidget(),
        flexibleText(
          text: 'Area',
          fontSize: 28,
          textColor: kLightFontColor,
          fontFamily: 'Lato',
          fontWeight: FontWeight.bold,
          padding: const EdgeInsets.all(15),
          alignment: Alignment.topLeft,
        ),
        AreaCardListWidget(),
      ],
    );
  }
}
