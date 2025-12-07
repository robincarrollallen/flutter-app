import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import 'modules/activity/view.dart';
import 'modules/support/view.dart';
import 'modules/swiper/view.dart';
import '/utils/screen.dart';
import 'logic.dart';

class DrawerView extends StatelessWidget {
  DrawerView({super.key});

  final logic = Get.put(DrawerLogic());
  final state = Get.find<DrawerLogic>().state;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return GestureDetector(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300.0.rem()),
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.only(
              topLeft: Radius.circular(12.0.rem()),
              bottomLeft: Radius.circular(12.0.rem()),
            ), // 设置圆角
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent, // 取消默认背景色
                elevation: 0.0, // 取消阴影
                titleSpacing: 0, // 取消两侧内边距
                title: Row(
                  children: [
                    Expanded(
                      child:  Container(
                        height: 50.0.rem(),
                        padding: EdgeInsets.symmetric(vertical: 10.0.rem()),
                        alignment: Alignment.centerLeft,
                        child: Image.network(
                          'https://upload-us.f-1-g-h.com/s3/1763076621057/480X112.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    IconButton(
                      style: ButtonStyle(
                        minimumSize: WidgetStateProperty.all(Size.square(30.0.rem())), // 设置最小尺寸
                        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0.rem()), // 调整圆角
                          ),
                        ),
                        backgroundColor: WidgetStateProperty.all(colors?.surfaceRaisedL2)
                      ),
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close, size: 16.0.rem())
                    ),
                  ]
                ),
              ),
              body: ListView(
                addAutomaticKeepAlives: false,
                padding: EdgeInsets.all(12.0.rem()),
                children: <Widget>[
                  DrawerSwiperView(),
                  DrawerActivityView(),
                ],
              ),
              bottomNavigationBar: DrawerSupportView()
            )
          )
        )
      ),
    );
  }
}