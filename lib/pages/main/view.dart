import 'package:flutter_app/i18n/type.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../theme/variables/custom.dart';
import '../../common/logic.dart';
import 'home/view.dart';
import 'tabBar/view.dart';
import 'profile/view.dart';
import 'deposit/view.dart';
import 'activity/view.dart';
import 'promotion/view.dart';

OverlayState? overlayState; /// overlay 状态

/// 底部导航栏页面
List<Widget> tabViewList=[
  HomePage(overlayState),
  ActivityPage(overlayState),
  PromotionPage(overlayState),
  DepositPage(overlayState),
  ProfilePage(),
];

/// 定义首页(有状态)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// 首页构建
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; /// 选中的底部导航栏下标
  final logic = Get.put(CommonLogic());
  final state = Get.find<CommonLogic>().state;

  void _onItemTapped(int index) { /// 点击导航栏触发的方法
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {  /// 生命周期: 初始化阶段
    if (Get.arguments != null && Get.arguments is int) {
      _selectedIndex = Get.arguments;
    }
    overlayState = Overlay.of(context); /// 获取 overlay 状态

    super.initState();
  }

  @override
  void dispose() {
    overlayState?.dispose(); /// 销毁

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>();

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
          index: _selectedIndex,
          children: tabViewList
      ), /// 页面显示主体
      bottomNavigationBar: BottomNavigationBar( /// 原生底部导航栏
        items: buildBarItems(context), /// 导航栏元素
        currentIndex: _selectedIndex, /// 当前选中项
        type: BottomNavigationBarType.fixed, /// 导航栏类型(显示label)
        onTap: _onItemTapped, /// 点击事件
        backgroundColor: colors?.footbar,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        mini: true,
        shape: StadiumBorder(side: BorderSide(style: BorderStyle.solid, color: Colors.yellowAccent)),
        onPressed: () { Get.updateLocale(LOCALE.enUS.locale); },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}