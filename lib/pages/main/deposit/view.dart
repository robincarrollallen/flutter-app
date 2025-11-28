import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class DepositPage extends StatelessWidget {
  const DepositPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(DepositLogic());
    final state = Get.find<DepositLogic>().state;

    return GetBuilder<DepositLogic>(builder: (logic) {
      return Scaffold(
          body: Stack(
            children: [

            ],
          )
      );
    });
  }
}
