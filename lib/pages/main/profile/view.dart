import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(TabPersonalLogic());
    final state = Get.find<TabPersonalLogic>().state;

    return GetBuilder<TabPersonalLogic>(builder: (logic) {
      return Scaffold(
          body: Stack(
            children: [

            ],
          )
      );
    });
  }
}
