import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class ActivityPage extends StatelessWidget {
  const ActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ActivityLogic());
    final state = Get.find<ActivityLogic>().state;

    return GetBuilder<ActivityLogic>(builder: (logic) {
      return Scaffold(
          body: Stack(
            children: [

            ],
          )
      );
    });
  }
}
