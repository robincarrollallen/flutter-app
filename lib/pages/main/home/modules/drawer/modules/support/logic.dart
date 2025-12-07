import 'package:get/get.dart';
import 'package:flutter/services.dart';
import '/model/dto/main_media_list_model.dart';
import 'state.dart';

class DrawerSupportLogic extends GetxController  {
  final DrawerSupportState state = DrawerSupportState();

  /// 生命周期: 初始化
  @override
  void onInit() {
    super.onInit();

    _loadMainMediaList();
  }

  /// 加载主媒体列表
  Future<List<MainMediaListModel>> _loadMainMediaList() async {
    final String jsonString = await rootBundle.loadString('assets/mock/main_media_list.json'); // 读取 JSON 文件
    final List<MainMediaListModel> list = mainMediaListModelFromJson(jsonString);
    state.mainMediaList.clear();
    state.mainMediaList.addAll(list);
    update();
    return list;
  }
}