import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'state.dart';

class LayoutLogic extends GetxController {
  final state = LayoutState();

  @override
  void onReady() {
    super.onReady();

    final context = Get.context;

    state.setPadding(MediaQuery.of(context!).padding);
  }
}