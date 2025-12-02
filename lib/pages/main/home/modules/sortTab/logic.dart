import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '/model/home_list_model.dart';
import '/widgets/sprite.dart';
import '/config/sprite.dart';
import '/utils/screen.dart';
import 'state.dart';

class SortTabLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final SortTabState state = SortTabState();

  late TabController tabController; // 定义导航标签控制器

  /// 生命周期: 初始化
  @override
  void onInit() {
    super.onInit();

    _loadHomeListData();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  Future<List<HomeListModel>> _loadHomeListData() async {
    final String jsonString = await rootBundle.loadString('assets/mock/home_list.json'); // 读取 JSON 文件
    final List<dynamic> jsonList = json.decode(jsonString); // 解析 JSON 数据
    final homeList = jsonList.map((json) => HomeListModel.fromJson(json)).toList(); // 生成列表数据
    state.setHomeList(homeList); // 缓存homeList

    final myTabs = homeList.map((item) {
      return SortTab(
        label: item.gameType,
        offset: Offset(gameCategoryConfig[item.gameType]!.dx, gameCategoryConfig[item.gameType]!.dy),
      );
    }).toList();

    state.setTabsValue(myTabs);

    tabController = TabController(vsync: this, length: state.tabs.length); // 赋值导航栏控制器
    update();
    return homeList;
  }
}

class SortTab extends StatelessWidget {
  final Widget? icon;
  final String label;
  final Offset offset;
  final double? fonSize;

  const SortTab({
    super.key,
    this.icon,
    this.label = '',
    this.offset = const Offset(0, 0),
    this.fonSize,
  });

  @override
  Widget build(BuildContext context) {
    
    return Tab(
      height: 80.0.rem(),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home/bg-game-category-$label-25.webp')
          )
        ),
        margin: EdgeInsets.only(left: 8.0.rem()),
        width: 80.0.rem(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 水平居中
          crossAxisAlignment: CrossAxisAlignment.center, // 垂直居中
          children: [
            icon ?? Sprite(
              scale: 100.0/(40.0.rem()),
              size: Size(
                40.0.rem(),
                40.0.rem(),
              ),
              imagePath: 'assets/sprite/game-category-25.webp',
              imageFullSize: Size(
                280.0.rem(),
                40.0.rem(),
              ),
              offset: Offset(offset.dx.rem(), offset.dy.rem())
            ),
            ?label.isEmpty ? null : Text(label, style: TextStyle(fontSize: fonSize ?? 12.0.rem(), fontWeight: FontWeight.w600))
          ],
        ),
      )
    );
  }
}