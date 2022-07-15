import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/constant.dart';
import 'package:flutter_application_1/pages/pages.dart';
import 'package:flutter_application_1/pages/signup_page.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialMediaOptions extends StatelessWidget {
  SocialMediaOptions(FirebaseAuth instance, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Row(
            children: const [
              Expanded(
                  child: Divider(
                color: kPrimaryColor,
              )),
              Text(
                " OR Continue with ",
                style: TextStyle(color: kLightGreyFontColor),
              ),
              Expanded(
                  child: Divider(
                color: kPrimaryColor,
              )),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  signInWithGoogle().whenComplete(() {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  });
                },
                child: Image.asset(
                  "assets/images/google.png",
                  width: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () async {
                  signInWithFacebook(context).whenComplete(() {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  });
                },
                child: Image.asset(
                  "assets/images/facebook.png",
                  width: 30,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }

  String userEmail = "";
  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    userEmail = googleUser!.email;

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  String userFace = "";

  Future<void> signInWithFacebook(BuildContext context) async {
    final LoginResult loginResult = await FacebookAuth.instance.login();

    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
