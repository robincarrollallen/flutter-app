import 'package:flutter/material.dart';
import 'package:flutter_app/components/ripple_button.dart';
import 'package:get/get.dart';
import 'dart:math';
import '/utils/screen.dart';
import '/theme/variables/custom.dart';
import 'modules/marquee/view.dart';
import 'modules/jackpot/view.dart';
import 'modules/sortTab/view.dart';
import 'modules/navBar/view.dart';
import 'modules/swiper/view.dart';
import 'modules/sign/view.dart';
import 'modules/pwa/view.dart';
import 'logic.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  HomePage({
    super.key,
    required this.scaffoldKey
  });

  final logic = Get.put(HomeLogic());
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return GetBuilder<HomeLogic>(
      builder: (logic) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(state.showPWA.value ? 100.0.rem() : 50.0.rem()),
            child: SafeArea(
              child: Column(
                children: [
                  ?state.showPWA.value ? PwaView() : null,
                  NavBarView(scaffoldKey: scaffoldKey)
                ],
              )
            ),
          ),
          body: CustomScrollView(
            slivers: <Widget>[
              // 滚动内容顶部模块，向上滚动并消失。
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SignView(),
                    SwiperView(),
                    MarqueeView(),
                    JackpotView(),
                  ]
                )
              ),
              // 固定置顶模块
              SliverPersistentHeader(
                pinned: true, // 这是关键，让它在到达顶部后固定住
                delegate: _SliverAppBarDelegate(
                  minHeight: 80.0.rem(),
                  maxHeight: 80.0.rem(),
                  child: SortTabView()
                ),
              ),
              // 滚动内容
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
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).padding.bottom
                ),
              )
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
  Widget build( BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
      minHeight != oldDelegate.minHeight ||
      child != oldDelegate.child;
  }
}
