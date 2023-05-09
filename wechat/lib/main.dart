import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:wechat/firebase_options.dart';
import 'package:wechat/screen/splash_screen.dart';

late Size mq;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 화면회전 안되게 고정
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  // 상단 상태 바 감추기(full-screen)
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  // );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 1,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
      ),
      home: SplashScreen(),
    );
  }
}
