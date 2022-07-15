import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/widgets/rounded_button.dart';
import 'package:flutter_application_1/pages/social_media_page.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/signin_page.dart';
import 'package:flutter_application_1/repository/services/auth_response.dart';
import 'package:flutter_application_1/repository/services/authentication_service.dart';
import 'package:flutter_application_1/repository/services/util.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameEditingController = TextEditingController();
  final TextEditingController emailEditingController = TextEditingController();
  final TextEditingController pwdEditingController = TextEditingController();
  final TextEditingController cfrnPwdEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Theme(
      data: themeData.copyWith(
          inputDecorationTheme: themeData.inputDecorationTheme.copyWith(
        prefixIconColor:
            MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) {
            return kPrimaryColor;
          }

          return kDarkGreyFontColor;
        }),
      )),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: kLightGreyFontColor),
            ),
            const SizedBox(
              height: 40,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    cursorColor: Colors.black,
                    controller: nameEditingController,
                    keyboardType: TextInputType.name,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        hintText: "Name",
                        prefixIcon: const Icon(
                          Icons.person,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        filled: true,
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        fillColor: kLightGreyFontColor),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter name";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    controller: emailEditingController,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        filled: true,
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        fillColor: kLightGreyFontColor),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    controller: pwdEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        filled: true,
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        fillColor: kLightGreyFontColor),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    controller: cfrnPwdEditingController,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
                        prefixIcon: const Icon(Icons.key),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        filled: true,
                        isDense: true,
                        contentPadding:
                            const EdgeInsets.fromLTRB(10, 10, 10, 10),
                        fillColor: kLightGreyFontColor),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm Password is required";
                      } else if (value != pwdEditingController.text) {
                        return "Password & Confirm Password should match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RoundedButton(
                      label: "SIGN UP",
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          AuthenticationService()
                              .signUpWithEmail(
                                  name: nameEditingController.text,
                                  email: emailEditingController.text,
                                  password: pwdEditingController.text)
                              .then((authResponse) {
                            if (authResponse.authStatus == AuthStatus.success) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                  (route) => false);
                            } else {
                              Util.showErrorMessage(
                                  context, authResponse.message);
                            }
                          });
                        }
                      })
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SocialMediaOptions(FirebaseAuth.instance),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyle(color: kLightGreyFontColor),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInScreen()),
                        (route) => false);
                  },
                  child: const Text("Sign In",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
