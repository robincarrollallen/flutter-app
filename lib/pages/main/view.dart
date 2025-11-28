import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../theme/variables/custom.dart';
import '../../utils/screen.dart';
import '../../common/logic.dart';
import '../../i18n/type.dart';
import 'home/view.dart';
import 'tabBar/view.dart';
import 'profile/view.dart';
import 'deposit/view.dart';
import 'activity/view.dart';
import 'promotion/view.dart';

OverlayState? overlayState; /// overlay 状态

/// 定义首页(有状态)
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// 首页构建
class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late final List<Widget> tabViewList; // 定义 tab 列表, 需要在 initState 更新 tabViewList<传入_scaffoldKey>

  int _selectedIndex = 0; /// 选中的底部导航栏下标
  final logic = Get.find<CommonLogic>();
  final state = Get.find<CommonLogic>().state;

  void _onItemTapped(int index) { /// 点击导航栏触发的方法
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    /// 生命周期: 初始化阶段
    super.initState();

    if (Get.arguments != null && Get.arguments is int) {
      _selectedIndex = Get.arguments;
    }
    overlayState = Overlay.of(context);

    /// 获取 overlay 状态

    tabViewList = [
      HomePage(scaffoldKey: _scaffoldKey), // 将 key 传给 HomePage
      ActivityPage(overlayState),
      PromotionPage(overlayState),
      DepositPage(overlayState),
      ProfilePage(),
    ];
  }

  @override
  void dispose() {
    overlayState?.dispose(); /// 销毁

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>
    final double bottomSafeArea = MediaQuery.of(context).padding.bottom; // 底部安全区高度
    final double topPaddingHeight = 40.0.rem(); // 底部导航栏上边距<背景图>
    final double tabBarContentHeight = kBottomNavigationBarHeight + topPaddingHeight; // 底部导航栏显示高度
    final double totalGradientHeight = topPaddingHeight + tabBarContentHeight + bottomSafeArea; // 底部导航栏整体高度
    final double stopValue = bottomSafeArea > 0 ? tabBarContentHeight / totalGradientHeight : 1.0; // 底部导航栏显示区占比<填充安全区背景色>

    return Scaffold(
      key: _scaffoldKey,
      extendBody: true,
      drawer: null,
      endDrawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300.0.rem()),
        child: Scaffold(
          appBar: AppBar(
            foregroundColor:Colors.transparent,
            elevation: 0.0
          ),
          body: ListView(
            addAutomaticKeepAlives: false,
            padding: EdgeInsets.zero,
            children: <Widget>[
              ListTile(
                title: const Text('返回'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: tabViewList
      ), /// 页面显示主体
      bottomNavigationBar: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/svg/tabBar/bg-25.svg',
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: topPaddingHeight),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent, // 起始颜色（透明）
                  Colors.transparent, // 中间颜色
                  ?colors?.footbar, // 结束颜色
                ],
                begin: Alignment.topCenter, // 渐变起始位置
                end: Alignment.bottomCenter, // 渐变结束位置
                stops: [0.0, stopValue, stopValue],
              ),
            ),
            child: BottomNavigationBar(
              items: buildBarItems(context),
              currentIndex: _selectedIndex,
              type: BottomNavigationBarType.fixed,
              onTap: _onItemTapped,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ],
      ),
      floatingActionButton: Transform.translate(
        offset: Offset(0, 60.0.rem()),
        child: SizedBox(
          width: 120.0.rem(),
          height: 120.0.rem(),
          child: GestureDetector(
            onTap: () { Get.updateLocale(LOCALE.enUS.locale); },
            behavior: HitTestBehavior.translucent,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/tabBar/tab/bg-flexible-25.webp'),
                )
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/tabBar/tab/flexible-25.webp',
                  fit: BoxFit.fill,
                  width: 38.0.rem(),
                  height: 38.0.rem(),
                ),
              )
            ),
          )
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}