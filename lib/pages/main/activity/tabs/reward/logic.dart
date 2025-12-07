import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import '/model/dto/activity_record_history_model.dart';
import '/components/refresh_list.dart';
import '/hooks/loading/loading.dart';
import 'state.dart';

class RewardLogic extends GetxController {
  final RewardState state = RewardState();
  final GlobalKey<RefreshListState> refreshListKey = GlobalKey<RefreshListState>();

  /// 模拟从网络获取数据
  Future<void> fetchData([bool isRefresh = false]) async {
    if (!isRefresh && !state.hasMoreData.value) return;

    await Future.delayed(const Duration(seconds: 1)); // 模拟网络延迟

    final list = await _loadActivityRecordHistoryData();

    if (isClosed) return; // 确认是否还挂载在 content 中

    if (isRefresh) {
      state.currentPage.value = 1;
      refreshListKey.currentState?.scrollController.jumpTo(0);
      state.activityRecordHistoryList.clear();
      state.setActivityRecordHistoryList(list);
      state.setHasMoreData(true);
    } else if (state.hasMoreData.value) {
      state.currentPage.value++;
      if (state.currentPage.value <= 2) {
        state.activityRecordHistoryList.addAll(list);
      } else {
        state.setHasMoreData(false);
        state.activityRecordHistoryList.addAll(list);
      }
    }
  }

  /// 处理下拉刷新的回调 isReset: 是否重置(切换列表参数)
  Future<void> handleRefresh([bool isReset = false]) async {
    if (isReset) {
      Loading.show();
    }
    await fetchData(true);
    if (isReset) {
      Loading.hide();
    }
  }

  /// 加载奖励列表
  Future<List<RecordList>> _loadActivityRecordHistoryData() async {
    final String jsonString = await rootBundle.loadString('assets/mock/activity_record_history.json'); // 读取 JSON 文件
    final jsonData = json.decode(jsonString); // 解析 JSON 数据
    final activityRecordHistoryData = ActivityRecordHistoryModel.fromJson(jsonData); // 生成列表数据
    return activityRecordHistoryData.recordList ?? [];
  }
}
