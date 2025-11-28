import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PromotionPage extends StatelessWidget {
  const PromotionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PromotionLogic());
    final state = Get.find<PromotionLogic>().state;

    return GetBuilder<PromotionLogic>(builder: (logic) {
      return Scaffold(
          body: Stack(
            children: [

            ],
          )
      );
    });
  }
}
