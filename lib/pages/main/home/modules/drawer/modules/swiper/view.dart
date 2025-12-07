import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '/pages/main/home/modules/swiper/logic.dart';
import '/theme/variables/custom.dart';
import '/utils/screen.dart';
import 'logic.dart';

class DrawerSwiperView extends StatelessWidget {
  DrawerSwiperView({ super.key });

  final logic = Get.put(DrawerSwiperLogic());
  final state = Get.find<DrawerSwiperLogic>().state;
  final swiperState = Get.find<SwiperLogic>().state;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return GetBuilder<DrawerSwiperLogic>(
      builder: (_) {
        return Container(
          padding: EdgeInsets.all(1.0.rem()),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                colors?.glowPrimaryOpacity40 ?? Colors.blue,
                Colors.transparent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12.0.rem())
          ),
          child: Container(
            padding: EdgeInsets.all(12.0.rem()),
            decoration: BoxDecoration(
              color: colors?.surfaceRaisedL2,
              borderRadius: BorderRadius.circular(12.0.rem())
            ),
            child: Column(
              spacing: 12.0.rem(),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 4.0.rem(),
                      children: [
                        Image.asset(
                          'assets/icons/tabBar/tab/promo.webp',
                          width: 20.0.rem(),
                        ),
                        Text('Bonuses', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0.rem())),
                      ],
                    ),
                    TextButton(
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(Size.zero),  // 设置最小尺寸
                        padding: WidgetStateProperty.all(EdgeInsets.zero),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 设置紧凑型<取消强制边距>
                      ),
                      onPressed: () => {},
                      child: Text('All', style: TextStyle(color: colors?.textBrandPrimary, fontSize: 12.0.rem())),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0.rem()),
                  child: CarouselSlider(
                    carouselController: logic.controller,
                    items: swiperState.bannerList.map((banner) {
                      return GestureDetector(
                        onTap: () {},
                        child: Image.network(
                          banner.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(child: CircularProgressIndicator());
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const Center(child: Icon(Icons.error, color: Colors.red));
                          },
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      initialPage: 0, // 初始索引
                      autoPlay: true, // 是否自动播放
                      reverse: false, // 是否反向播放
                      aspectRatio: 16 / 9, // 宽高比
                      viewportFraction: 1, // 视图中每个页面占比
                      enlargeCenterPage: false, // 是否放中心页面
                      enableInfiniteScroll: true, // 是否允许无限循环
                      scrollDirection: Axis.horizontal, // 滚动方向
                      autoPlayCurve: Curves.fastOutSlowIn, // 动画曲线
                      autoPlayInterval: const Duration(seconds: 3), // 自动播放间隔
                      autoPlayAnimationDuration: const Duration(milliseconds: 800), // 自动播放动画时长
                      onPageChanged: (index, reason) { state.setCurrentIndex(index); },
                    ),
                  ),
                ),
                Obx(() => Row(
                  spacing: 8.0.rem(),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: swiperState.bannerList.asMap().entries.map((entry) {
                    return GestureDetector(
                      onTap: () => logic.controller.animateToPage(entry.key),
                      child: Container(
                        width: state.currentIndex.value == entry.key ? 20.0.rem() : 8.0.rem(),
                        height: 4.0.rem(),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0.rem()),
                          color: state.currentIndex.value == entry.key ? colors?.iconBrandPrimary : colors?.iconWeaker,
                        ),
                      ),
                    );
                  }).toList(),
                ))
              ],
            )
          )
        );
      }
    );
  }
}