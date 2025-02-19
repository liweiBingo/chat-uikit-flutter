import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
class Timuikitcreategroupexample extends StatefulWidget {

  const Timuikitcreategroupexample({Key? key}) : super(key: key);


  @override
  State<Timuikitcreategroupexample> createState() => _TimuikitcreategroupexampleState();
}

class _TimuikitcreategroupexampleState extends State<Timuikitcreategroupexample> {


  List<V2TimFriendInfo> friendList = [];
  final V2TIMManager _sdkInstance = TIMUIKitCore.getSDKInstance();




  _getConversationList() async {
    final res = await _sdkInstance.getFriendshipManager().getFriendList();
    if (res.code == 0 && res.data != null) {
      setState(() {
        friendList = res.data!;

      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getConversationList();
  }

  @override
  Widget build(BuildContext context) {
         return ContactList(contactList: friendList,              isCanSelectMemberItem: true,
         );

  }
}


