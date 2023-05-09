import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wechat/api/api.dart';
import 'package:wechat/models/user_model.dart';

import '../widgets/custom_chat_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<UserModel> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WeChat"),
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.home_outlined)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
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
      body: StreamBuilder(
        stream: WechatApi.firestore.collection("users").snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            // if data is loading
            case ConnectionState.waiting:
            case ConnectionState.none:
              return Center(child: CircularProgressIndicator());

            // if some or all data is loaded then show it
            case ConnectionState.active:
            case ConnectionState.done:
              final data = snapshot.data!.docs;
              list = data.map((e) => UserModel.fromJson(e.data())).toList();

              if (list.isNotEmpty) {
                return ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  physics: BouncingScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return CustomUserChat(user: list[index]);
                  },
                );
              } else {
                return Center(
                  child: Text(
                    "Not Found message",
                    style: TextStyle(fontSize: 25),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
