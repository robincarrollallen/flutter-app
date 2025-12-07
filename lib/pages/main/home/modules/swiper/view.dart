import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../modules/swiper/logic.dart';
import '/utils/screen.dart';

class SwiperView extends StatelessWidget {
  SwiperView({super.key});

  final logic = Get.lazyPut<SwiperLogic>(() => SwiperLogic());
  final state = Get.find<SwiperLogic>().state;

  @override
  Widget build(BuildContext context) {

    return GetBuilder<SwiperLogic>(
      builder: (logic) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0.rem(), vertical: 2.0.rem()),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0.rem()),
                child: CarouselSlider(
                  items: state.bannerList.map((banner) {
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
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10.0.rem(),
              child: Image.asset(
                'assets/icons/home/badge-banner.webp',
                width: 54.0.rem(),
                height: 54.0.rem(),
              ),
            )
          ]
        );
      }
    );
  }
}