import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        return Transform.translate(
          offset: Offset(-8.0.rem(), 0),
          child: CarouselSlider(
            items: state.bannerList.map((banner) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.only(right: 12.0.rem()),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0.rem()),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0.rem()),
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
                  ),
                ),
              );
            }).toList(),
            options: CarouselOptions(
              initialPage: 0,
              autoPlay: true,
              aspectRatio: 16 / 9,
              padEnds: true,
              viewportFraction: 0.9, // 保持小于 1，这样右侧会留出空间显示下一张
              disableCenter: true,
              enlargeCenterPage: false, // 靠左对齐时，通常关闭"中间放大"效果，视觉上更协调
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
          ),
        );
      },
    );
  }
}
