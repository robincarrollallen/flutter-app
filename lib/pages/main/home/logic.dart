import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  /// 生命周期: 初始化
  @override
  void onInit() {
    super.onInit();

    print('pwa: ${state.showPWA.value}');
  }
}