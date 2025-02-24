import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/base_widgets/tim_ui_kit_statelesswidget.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/optimize_utils.dart';


import 'package:tencent_cloud_chat_uikit/base_widgets/tim_ui_kit_base.dart';
import 'package:tencent_cloud_chat_uikit/ui/utils/screen_utils.dart';
import 'package:tencent_cloud_chat_uikit/ui/views/TIMUIKitSearch/pureUI/tim_uikit_search_input.dart';
import 'package:tencent_im_base/tencent_im_base.dart';

class GroupMemberSearchTextField extends TIMUIKitStatelessWidget {
  final Function(String text) onTextChange;
  GroupMemberSearchTextField({Key? key, required this.onTextChange})
      : super(key: key);

  @override
  Widget tuiBuild(BuildContext context, TUIKitBuildValue value) {
    final TUITheme theme = value.theme;
    final isDesktopScreen =
        TUIKitScreenUtils.getFormFactor(context) == DeviceType.Desktop;
    final FocusNode focusNode = FocusNode();

    var debounceFunc = OptimizeUtils.debounce(
        (text) => onTextChange(text), const Duration(milliseconds: 300));

    return Container(
      color: Colors.black,
      padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      child: Column(children: [
        if(!isDesktopScreen) Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(13)),
              // border: Border.all(color: theme.weakBackgroundColor!, width: 12)
            color: Color(0x33FFFFFF)
          ),
          child: TextField(
            onChanged: debounceFunc,
            style:TextStyle(fontSize: 14,color: Colors.white) ,
            decoration: InputDecoration(
              //去掉下划线
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12), // 调整垂直间距
              hintText: TIM_t("搜索"),
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search,color: Colors.grey,),
            ),
          ),
        ),
        if(isDesktopScreen) TIMUIKitSearchInput(prefixIcon: Icon(
          Icons.search,
          size: 16,
          color: hexToColor("979797"),
        ),
          onChange: (text){
          focusNode.requestFocus();
            debounceFunc(text);
          }, focusNode: focusNode,
        ),
        // Divider(
        //     thickness: 1,
        //     indent: 74,
        //     endIndent: 0,
        //     color: theme.weakBackgroundColor,
        //     height: 0)
      ]),
    );
  }
}
