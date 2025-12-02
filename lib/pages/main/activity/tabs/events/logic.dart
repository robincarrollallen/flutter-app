import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/model/activity_list_model.dart';
import 'state.dart';

class EventsLogic extends GetxController {
  final EventsState state = EventsState();

  /// 生命周期: 初始化
  @override
  void onInit() {
    super.onInit();

    _loadActivityData();
  }

  /// 加载活动列表
  Future<List<ActivityListModel>> _loadActivityData() async {
    final String jsonString = await rootBundle.loadString('assets/mock/activity_list.json'); // 读取 JSON 文件
    final List<dynamic> jsonList = json.decode(jsonString); // 解析 JSON 数据
    final activityList = jsonList.map((json) => ActivityListModel.fromJson(json)).toList(); // 生成列表数据
    state.setActivityList(activityList); // 缓存activityList
    update();
    return activityList;
  }
}