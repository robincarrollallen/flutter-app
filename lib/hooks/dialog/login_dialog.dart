import 'package:flutter/material.dart';
import '/pages/login/view.dart';

void showLoginSheet(BuildContext context, {type = 'login'}) {
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
