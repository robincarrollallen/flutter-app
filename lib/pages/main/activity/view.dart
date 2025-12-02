import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import 'logic.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return GetBuilder<ActivityLogic>(
      init: ActivityLogic(),
      builder: (logic)
    {
      return Scaffold(
        appBar: AppBar(
          elevation: 0, // 取消阴影
          titleSpacing: 0, // 取消两侧内边距
          title: TabBar(
            dividerColor: Colors.transparent,
            controller: logic.tabController, // 取消底部边框线
            tabs: logic.tabs,
            isScrollable: true,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            tabAlignment: TabAlignment.start,
            indicatorColor: colors?.textSelected,
            labelColor: colors?.textSelected,
            unselectedLabelColor: colors?.textWeak,
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
        body: TabBarView(
          controller: logic.tabController,
          children: logic.tabViews
        ),
      );
    });
  }
}
