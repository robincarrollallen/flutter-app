import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/hooks/dialog/toast_dialog.dart';

/// 复制并显示提示
void copyToClipboard(BuildContext context, String text) {
  Clipboard.setData(ClipboardData(text: text));
  ToastDialog.show(context, 'Successfully');
}