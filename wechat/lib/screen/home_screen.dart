import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wechat/api/api.dart';
import 'package:wechat/widgets/custom_chat_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WeChat"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 20),
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomUserChat();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await WechatApi.auth.signOut();
          await GoogleSignIn().signOut();
        },
        child: Icon(
          Icons.mail_outline_rounded,
          size: 35,
        ),
      ),
    );
  }
}
