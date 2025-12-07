import 'package:get/get.dart';

class DrawerSwiperState {
  final currentIndex = 0.obs;

  void setCurrentIndex(int index) {
    currentIndex.value = index;
  }
}
