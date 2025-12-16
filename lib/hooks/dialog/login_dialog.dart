import 'package:flutter_app/store/status/logic.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/pages/login/view.dart';

void showLoginSheet(BuildContext context, [String? type = 'login']) {
  final state = Get.find<StatusLogic>().state;
  state.setLoginVisibleType(type);

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    // 设置顶部圆角
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(16),
      ),
    ),
    clipBehavior: Clip.antiAlias,
    builder: (context) => LoginPage()
  );
}
