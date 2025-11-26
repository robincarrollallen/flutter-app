import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'state.dart';

class CommonLogic extends GetxController {
  final CommonState state = CommonState(); // 全局数据状态

  @override
  void onReady() {
    super.onReady();

    // setStatBarHeight();
  }

  // setStatBarHeight() {
  //   BuildContext context = Get.context!;
  //   state.statusBarHeight = MediaQuery.of(context).padding.top;
  //   update();
  // }
  //
  // setUserInfo(User user) {
  //   state.userInfo = user;
  //   update();
  // }
}