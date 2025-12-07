import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '/components/refresh_list.dart';
import '/constants/options/date.dart';
import '/theme/variables/custom.dart';
import '/model/domain/options_model.dart';
import '/utils/screen.dart';
import 'logic.dart';

class RewardListView extends StatelessWidget {
  RewardListView({super.key});

  final logic = Get.put(RewardLogic());
  final state = Get.find<RewardLogic>().state;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展

    /// 列表元素部件
    Widget recordItemBuilder(BuildContext context, int index) {
      final item = state.activityRecordHistoryList[index];
      final screenWidth = MediaQuery.of(context).size.width;

      return Container(
        height: 52.0.rem(),
        decoration: BoxDecoration(
          color: index % 2 != 0 ? null : colors?.surfaceLowered,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: screenWidth / 4,
              child: Center(
                child: Text(
                  DateFormat('MM/dd HH:mm').format(item.time!),
                  style: TextStyle(color: colors?.textWeak),
                )
              ),
            ),
            SizedBox(
              width: screenWidth / 4,
              child: Center(
                child: Text(
                  '${item.activityName}',
                  style: TextStyle(color: colors?.textWeaker),
                )
              ),
            ),
            SizedBox(
              width: screenWidth / 4,
              child: Center(
                child: Text(
                  (item.minAwardCount != null && item.maxAwardCount != null)
                  ? '${item.minAwardCount} ~ ${item.maxAwardCount}'
                  : 'item.awardCount',
                  style: TextStyle(color: colors?.textWarning),
                )
              ),
            ),
            SizedBox(
              width: screenWidth / 4,
              child: Center(
                child: Text(
                  '${item.awardType?.name}',
                  style: TextStyle(color: colors?.textWeaker),
                )
              ),
            ),
          ]
        ),
      );
    }

    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10.0.rem()),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 4.0.rem()),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0.rem()),
                  color: colors?.surfaceRaisedL1
                ),
                child: Row(
                  children: [
                    Text('See the date: ', style: TextStyle(color: colors?.textWeaker, fontSize: 12.0.rem())),
                    Obx(() => DropdownButton(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      hint: Text('Select', style: TextStyle(fontSize: 12.0.rem(), color: colors?.textWeaker)),
                      onChanged: (dynamic newValue) {
                        if (newValue != null && newValue != state.day.value) {
                          state.setDay(newValue);
                          logic.handleRefresh(true);
                        }
                      },
                      value: state.day.value,
                      underline: Container(), // 移除下划线。
                      icon: const Icon(Icons.arrow_drop_down), // 自定义后置图标
                      dropdownColor: colors?.surfaceRaisedL2,
                      borderRadius: BorderRadius.circular(6.0),
                      menuMaxHeight: MediaQuery.of(context).size.height / 2,
                      isDense: true, // 紧凑模式<去除固定内边距>
                      items: daysOptions.map((OptionsModel option) {
                        return DropdownMenuItem(
                          value: option.value,
                          child: Text(
                            option.label,
                            style: TextStyle(
                              fontSize: 12.0.rem(),
                              color: state.day.value == option.value ? colors?.textDefault : colors?.textWeaker,
                            )
                          ),
                        );
                      }).toList(),
                    ))
                  ],
                ),
              ),
              Row(
                children: [
                  Text('bonus: ', style: TextStyle(fontSize: 16.0.rem())),
                  Text('0.00', style: TextStyle(color: colors?.textWarning, fontSize: 16.0.rem(), fontWeight: FontWeight.bold),),
                ],
              )
            ],
          )
        ),
        Expanded(
          child: Obx(() => RefreshList(
            key: logic.refreshListKey,
            onRefresh: logic.handleRefresh,
            onLoad: logic.fetchData,
            items: state.activityRecordHistoryList,
            more: state.hasMoreData.value,
            itemBuilder: recordItemBuilder,
          ))
        )
      ],
    );
  }
}