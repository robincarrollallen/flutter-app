import 'package:get/get.dart';
import '/model/banner_model.dart';

class SwiperState {
  final RxList<BannerModel> bannerList = <BannerModel>[].obs;

  void setBannerList(List<BannerModel> list) {
    bannerList.value = list;
  }
}
