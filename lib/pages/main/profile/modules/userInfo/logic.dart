import 'package:flutter/material.dart';
import 'package:flutter_app/router/route.dart';
import 'package:get/get.dart';
import '/hooks/dialog/confirm_dialog.dart';
import '/hooks/loading/loading.dart';

class UserInfoLogic extends GetxController {

/// 模拟从网络获取数据
Future<void> handleWithdraw(BuildContext context) async {
   // TODO 模拟网络延迟
   Loading.show();
   await Future.delayed(const Duration(seconds: 1));
   Loading.hide();

   if (!context.mounted) return;

   showDialog(
     context: context,
     builder: (context) => ConfirmDialog(
       content: 'For your fund\'s safety, please set up a fund password first',
       onConfirm: () {
         Get.toNamed(AppRoute.payPassword.path);
       },
       onCancel: () {
         print('Cancel');
       },
     ),
   );
 }
}