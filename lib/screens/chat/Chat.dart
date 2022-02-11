import 'package:chat/components/bodyChat.dart';
import 'package:chat/constants.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: BodyChat());
  }

  AppBar buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          BackButton(),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          SizedBox(
            width: kDefaultPadding * 0.75,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Jenny",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 5m ago",
                style: TextStyle(fontSize: 14),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(icon: Icon(Icons.phone), onPressed: () {}),
        IconButton(icon: Icon(Icons.videocam), onPressed: () {})
      ],
    );
  }
}
