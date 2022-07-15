import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/widgets/rounded_button.dart';
import 'package:flutter_application_1/pages/signin_page.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:flutter_application_1/repository/services/auth_response.dart';
import 'package:flutter_application_1/repository/services/authentication_service.dart';
import 'package:flutter_application_1/repository/services/util.dart';

class ForgotPasswordForm extends StatelessWidget {
  ForgotPasswordForm({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailEditingController = TextEditingController();

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
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const Text(
            "Forgot Password",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kLightGreyFontColor),
          ),
          const SizedBox(
            height: 30,
          ),
          Form(
              key: _formKey,
              child: Column(children: [
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
                      contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      fillColor: Colors.grey[300]),
                  //Lets apply validation
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
                RoundedButton(
                    label: "RESET PASSWORD",
                    onPressed: () {
                      AuthenticationService()
                          .resetPassword(email: emailEditingController.text)
                          .then((authResponse) {
                        if (authResponse.authStatus == AuthStatus.success) {
                          Util.showSuccessMessage(context,
                              "Email has been sent to reset password, please check your email id");
                        } else {
                          Util.showErrorMessage(context, authResponse.message);
                        }
                      });
                    })
              ])),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account? ",
                  style: TextStyle(color: kLightGreyFontColor)),
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
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account? ",
                  style: TextStyle(color: kLightGreyFontColor)),
              InkWell(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                      (route) => false);
                },
                child: const Text("Sign Up",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)),
              )
            ],
          )
        ]),
      ),
    );
  }
}
