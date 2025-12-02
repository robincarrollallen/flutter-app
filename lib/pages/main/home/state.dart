import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '/storage/persistent.dart';

class HomeState {
  final showPWA = PersistentRx('showPWA', kIsWeb ? true : false);

  final RxList<Widget> tabs = <Widget>[].obs;

  void setShowPWA ([bool show = false]) {
    showPWA.value = show;
  }

  void setTabsValue (List<Widget> tabList) {
    tabs.value = tabList;
  }
}
