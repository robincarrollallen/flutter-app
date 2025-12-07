import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/model/dto/lobby_sidebar_banner_list_model.dart';
import 'state.dart';

class DrawerActivityLogic extends GetxController {
  final DrawerActivityState state = DrawerActivityState();

  /// 生命周期: 初始化
  @override
  void onInit() {
    super.onInit();

    _loadSidebarActivityList();
  }

  /// 加载侧边栏活动列表
  Future<List<LobbySidebarBannerListModel>> _loadSidebarActivityList() async {
    final String jsonString = await rootBundle.loadString('assets/mock/lobby_sidebar_banner_list.json'); // 读取 JSON 文件
    final List<LobbySidebarBannerListModel> list = lobbySidebarBannerListModelFromJson(jsonString);
    final List<LobbySidebarBannerListModel> filteredList = list.where((item) {
      return item.name != null && item.name!.isNotEmpty;
    }).toList();
    state.sidebarActivityList.clear();
    state.sidebarActivityList.addAll(filteredList);
    update();
    return filteredList;
  }
}