import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/main/home/modules/sign/view.dart';
import '../../../theme/variables/custom.dart';
import '../../../utils/screen.dart';
import 'logic.dart';
import 'modules/navBar/view.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const HomePage({
    super.key,
    required this.scaffoldKey
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return GetBuilder<HomeLogic>(
      init: HomeLogic(),
      builder: (logic) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(logic.state.showPWA.value ? 100.0.rem() : 50.0.rem()),
            child: SafeArea(
              child: Column(
                children: [
                  NavBarView(scaffoldKey: scaffoldKey)
                ],
              )
            ),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              // Sliver 1: 初始内容，会正常向上滚动并消失。
              // 我们把之前的 Transform 组件放在这里。
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SignView()
                  ]
                )
              ),

              // Sliver 2: 这个组件一开始在Sliver 1下方，当Sliver 1滚出屏幕后，它会固定在顶部。
              SliverPersistentHeader(
                pinned: true, // 这是关键，让它在到达顶部后固定住
                delegate: _SliverAppBarDelegate(
                  minHeight: 60.0,
                  maxHeight: 60.0,
                  child: Container(
                    color: Theme.of(context).canvasColor, // 确保有背景色，避免下方内容穿透
                    child: const Center(
                      child: Text('滚动到这里时，我将固定在顶部'),
                    ),
                  ),
                ),
              ),

              // Sliver 3: 主体内容列表，会从固定的Sliver 2下方继续滚动。
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      color: index.isEven ? Colors.amber : Colors.orange,
                      height: 100.0,
                      child: Center(
                        child: Text('主体内容列表项 $index'),
                      ),
                    );
                  },
                  childCount: 20, // 列表项数量
                ),
              ),
            ],
          )
        );
      }
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
