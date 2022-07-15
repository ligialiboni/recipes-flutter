import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/mobile_layout.dart';
import 'package:flutter_application_1/models/responsive_layout.dart';
import 'package:flutter_application_1/models/forgot_password_form.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileChild: MobileLayout(
      imageWidget: Image.asset(
        "assets/images/hatavatar.png",
        scale: 3,
      ),
      dataWidget: ForgotPasswordForm(),
    ));
  }
}
