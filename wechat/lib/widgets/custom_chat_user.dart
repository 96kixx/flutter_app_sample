import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomUserChat extends StatelessWidget {
  const CustomUserChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // color: Colors.blue.shade100,
      elevation: 1,
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(CupertinoIcons.person),
          ),
          title: Text("테스트 유저"),
          subtitle: Text("Last user message", maxLines: 1),
          trailing: Text(
            "1시간 전",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
