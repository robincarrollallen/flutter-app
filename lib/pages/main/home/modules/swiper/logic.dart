import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '/model/banner_model.dart';
import 'state.dart';

class SwiperLogic extends GetxController {
  final SwiperState state = SwiperState();

  /// 生命周期: 初始化
  @override
  void onInit() {
    super.onInit();

    _loadSwiperData(); // 加载数据
  }

  /// 加载轮播图列表
  Future<List<BannerModel>> _loadSwiperData() async {
    final String jsonString = await rootBundle.loadString('assets/mock/banner_list.json'); // 读取 JSON 文件
    final List<dynamic> jsonList = json.decode(jsonString); // 解析 JSON 数据
    final bannerList = jsonList.map((json) => BannerModel.fromJson(json)).toList(); // 生成列表数据
    state.setBannerList(bannerList); // 缓存bannerList
    update();
    return bannerList;
  }
}