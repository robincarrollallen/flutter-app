import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/model/home_list_model.dart';

class SortTabState {
  final RxList<Widget> tabs = <Widget>[].obs;
  final RxList<HomeListModel> homeList = <HomeListModel>[].obs;

  void setTabsValue (List<Widget> tabList) {
    tabs.value = tabList;
  }

  void setHomeList(List<HomeListModel> list) {
    homeList.value = list;
  }
}
