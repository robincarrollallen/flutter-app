import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import 'logic.dart';

class SortTabView extends StatelessWidget {
  SortTabView({ super.key });

  final logic = Get.put(SortTabLogic());
  final state = Get.find<SortTabLogic>().state;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return GetBuilder<SortTabLogic>(
      builder: (logic) {
        return Container(
          color: colors?.bodyDefault, // 确保有背景色，避免下方内容穿透
          child: logic.state.tabs.isEmpty ? null : TabBar(
            tabAlignment: TabAlignment.start,
            controller: logic.tabController,
            labelPadding: EdgeInsets.all(0),
            tabs: state.tabs,
            isScrollable: true, // 标签可以横向滚动
            labelColor: colors?.textDefault,
            unselectedLabelColor: colors?.textDefault,
            indicatorColor: Colors.transparent,
            indicatorWeight: 0.01,
            // labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            onTap: (index) {
              print('${state.tabs[index]}: $index');
            },
          )
        );
      }
    );
  }
}