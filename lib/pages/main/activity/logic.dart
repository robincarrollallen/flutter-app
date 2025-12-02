import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'tabs/events/view.dart';
import 'tabs/reward/view.dart';

import 'state.dart';

class ActivityLogic extends GetxController with GetSingleTickerProviderStateMixin  {
  final ActivityState state = ActivityState();

  late final TabController tabController;

  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Events'),
    const Tab(text: 'Reward'),
  ];

  final List<Widget> tabViews = [
    EventsListView(),
    const RewardListView(),
  ];

  /// 生命周期: 初始化
  @override
  void onInit() {
    super.onInit();

    tabController = TabController(length: tabs.length, vsync: this);
  }
}