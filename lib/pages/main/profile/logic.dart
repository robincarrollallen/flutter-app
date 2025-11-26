import 'package:get/get.dart';

import 'state.dart';

class TabPersonalLogic extends GetxController {
  final TabPersonalState state = TabPersonalState();

  onScroll(double pixels) {
    if (pixels <= 0) {
      state.appBarAlpha = 0.0;
    } else if (pixels <= 100 ) {
      state.appBarAlpha = pixels / 100;
    } else {
      state.appBarAlpha = 1.0;
    }
    update();
  }
}