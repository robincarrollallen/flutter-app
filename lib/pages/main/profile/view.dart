import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'modules/navigation/view.dart';
import 'modules/userInfo/view.dart';
import '/utils/screen.dart';
import 'logic.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TabPersonalLogic());
    final state = Get.find<TabPersonalLogic>().state;

    return GetBuilder<TabPersonalLogic>(builder: (logic) {

      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.rem()),
          child: Stack(
            children: [
              Positioned(
                child: Center( // 使用 Center 配合 OverflowBox 让其向两边溢出
                  child: OverflowBox(
                    maxWidth: double.infinity,
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 2, // 这里设置图片所在的容器为2倍宽
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile/yellow-dark-top-bg.webp'),
                          fit: BoxFit.fitWidth, // 图片会撑满这个2倍宽的容器
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  UserInfo(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ProfileNavigation()
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      );
    });
  }
}
