import 'package:flutter/material.dart';
import 'package:wechat/screen/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => HomeScreen()));
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
