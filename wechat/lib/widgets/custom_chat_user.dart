import 'package:flutter/material.dart';
import 'package:wechat/models/user_model.dart';

class CustomUserChat extends StatefulWidget {
  final UserModel user;
  const CustomUserChat({
    super.key,
    required this.user,
  });

  @override
  State<CustomUserChat> createState() => _CustomUserChatState();
}

class _CustomUserChatState extends State<CustomUserChat> {
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
            child: Image.network(widget.user.image),
          ),
          title: Text(widget.user.displayName),
          subtitle: Text(widget.user.about, maxLines: 1),
          trailing: Text(
            "1시간 전",
            style: TextStyle(color: Colors.black54),
          ),
        ),
      ),
    );
  }
}
