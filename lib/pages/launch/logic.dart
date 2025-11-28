import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LaunchLogic extends GetxController {

  @override
  void onReady() {
    super.onReady();

    Get.offAllNamed('');
  }
}