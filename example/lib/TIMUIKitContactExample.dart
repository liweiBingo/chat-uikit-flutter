// ignore_for_file: file_names

import 'package:example/TIMUIKitChatExample.dart';
import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';

class TIMUIKitContactExample extends StatelessWidget {
  const TIMUIKitContactExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TIMUIKitConversation(

onTapItem: (item){
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(item.showName??''),
        ),
        body: TIMUIKitChatExample(selectedConversation: item,),
      ),
    ),
  );
},
    );
  }
}
