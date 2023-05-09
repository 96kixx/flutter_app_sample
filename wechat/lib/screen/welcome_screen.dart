import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wechat/api/api.dart';
import 'package:wechat/helper/dialogs.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  googleLoginHandler() {
    Dialogs.showProgressBar(context);

    signInWithGoogle().then((user) {
      Navigator.pop(context);
      if (user != null) {
        print('\nUser: ${user.user}');
        print('\nUserAdditionalInfo: ${user.additionalUserInfo}');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      }
    });
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await WechatApi.auth.signInWithCredential(credential);
    } catch (error) {
      print("result: $error");
      Dialogs.showSnackBar(context, "It has error, check again");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 40,
        ),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Column(
                children: [
                  SizedBox(height: 70),
                  Text(
                    "Welcome to WeChat",
                    style: TextStyle(fontSize: 35),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Image.asset(
                      "assets/images/messenger.png",
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: ElevatedButton.icon(
                onPressed: () {
                  googleLoginHandler();
                },
                icon: Icon(
                  Icons.login,
                  color: Colors.black,
                  size: 30,
                ),
                label: Text(
                  "Google로 시작하기",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: StadiumBorder(),
                  elevation: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
