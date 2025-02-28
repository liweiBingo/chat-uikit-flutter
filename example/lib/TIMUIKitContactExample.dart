// ignore_for_file: file_names

import 'package:example/TIMUIKitChatExample.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class TIMUIKitContactExample extends StatelessWidget {
  const TIMUIKitContactExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TIMUIKitContact(
      onTapItem: (c){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                  appBar: AppBar(title: Text(c.userProfile?.nickName??'')),
                  body: TIMUIKitChatExample(
                    selectedConversation: V2TimConversation(conversationID: c.userID,userID: c.userID),
                  )),
            ));
      },
    );
  }
}
