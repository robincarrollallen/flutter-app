import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:number_flow/number_flow.dart';
import '/theme/variables/custom.dart';
import '/utils/screen.dart';
import 'logic.dart';

class JackpotView extends StatelessWidget {

  JackpotView({ super.key });

  final logic = Get.put(JackpotLogic());
  final state = Get.find<JackpotLogic>().state;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>();

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 12.0.rem()),
      child: Column(
        spacing: 10.0.rem(),
        children: [
          TopBorder(),
          Row(
            spacing: 10.0.rem(),
            children: [
              Image.asset(
                'assets/images/home/bonus-25.webp',
                width: 88.0.rem(),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Jackpot', style: TextStyle(fontSize: 14.0.rem(), color: colors?.textWeak)),
                    SizedBox(
                      height: 58.0.rem(),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Obx(() => NumberFlow(
                          value: state.bonusValue.value,
                          animated: true,                           // 保留动画
                          startFromZero: false,                     // 不每次从 0 开始
                          decimalPlaces: 2,                         // 保留小数
                          useGroupSeparator: true,                  // 千分位
                          // notation: NumberNotation.standard,     // 标准计数
                          // spinDuration: Duration.zero,           // 禁止滚动动画
                          // opacityDuration: Duration.zero,        // 禁止淡入淡出
                          style: TextStyle(
                            fontSize: 32.0.rem(),
                            fontWeight: FontWeight.bold,
                            color: colors?.textBrandPrimary
                          ),
                        ))
                      )
                    )
                  ]
                )
              )
            ]
          )
        ],
      ),
    );
  }
}

class TopBorder extends StatelessWidget {
  const TopBorder({super.key});

  @override
  Widget build(BuildContext context) {
    const int red = 255;
    const int green = 162;
    const int blue = 0;

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(red, green, blue, 0.196),
            offset: const Offset(0, 2.51),
            blurRadius: 2.54,
          ),
          BoxShadow(
            color: const Color.fromRGBO(red, green, blue, 0.28),
            offset: const Offset(0, 6.34),
            blurRadius: 6.43,
          ),
          BoxShadow(
            color: const Color.fromRGBO(red, green, blue, 0.35),
            offset: const Offset(0, 12.94),
            blurRadius: 13.11,
          ),
          BoxShadow(
            color: const Color.fromRGBO(red, green, blue, 0.435),
            offset: const Offset(0, 26.65),
            blurRadius: 27.01,
          ),
          BoxShadow(
            color: const Color.fromRGBO(red, green, blue, 0.63),
            offset: const Offset(0, 73),
            blurRadius: 74,
          ),
        ],
      ),
      child: Container(
        height: 2.0.rem(),
        color: Color.fromRGBO(255, 135, 67, 1),
      )
    );
  }
}