import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/widgets/svg/vipBackground.dart';
import '/components/progressbar.dart';
import '/theme/variables/custom.dart';
import '/widgets/vip_tag/view.dart';
import '/utils/screen.dart';
import 'logic.dart';

class VipWrap extends StatelessWidget {
  VipWrap({super.key});

  final controller = Get.put(VipWrapController());

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return Padding(
      padding: EdgeInsets.only(top: 16.0.rem()),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: VipBackground(
              startColor: Color(0xFF2A2A2A),
              endColor: Color(0xFF3B3B3B),
            ),
          ),
          Positioned(
            right: 0,
            top: -16.0.rem(),
            child: Container(
              width: 110.rem(),
              height: 46.rem(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF22262E),
                    Color(0xFF34383E),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50.0.rem()))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('VIP Details', style: TextStyle(fontSize: 12.0.rem())),
                  Icon(Icons.keyboard_arrow_right, color: colors?.iconDefault, size: 30.0.rem())
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(12.0.rem()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 12.0.rem(),
                  children: [
                    SizedBox(
                      width: 88.rem(),
                      height: 38.rem(),
                      child: VipTag(),
                    ),
                    Text('Current Level', style: TextStyle(fontWeight: FontWeight.bold, color: colors?.textWeaker, fontSize: 12.0.rem()))
                  ]
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(top: 12.rem()),
                  child: Row(
                    spacing: 12.0.rem(),
                    children: [
                      Expanded(
                        child: ProgressBar(
                          progress: .8,
                          height: 4.0.rem(),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFFbe99ff),
                              Color(0xFF7232dd),
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )
                        )
                      ),
                      SizedBox(
                        width: 64.rem(),
                        height: 24.rem(),
                        child: VipTag(level: 1),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(vertical: 8.0.rem()),
                  child: Text('Promotion Criteria', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0.rem(), color: colors?.textWeaker)),
                ),
                Row(
                  children: [
                    Text('• Deposit required: ', style: TextStyle( fontSize: 12.0.rem(), color: colors?.textWeaker)),
                    Text('0.00 ', style: TextStyle(fontSize: 12.0.rem(), color: colors?.textWarning)),
                    Text('(0.00/10.00)', style: TextStyle(fontSize: 12.0.rem(), color: colors?.textHighlightWhite)),
                  ],
                ),
                Row(
                  children: [
                    Text('• Required bet: ', style: TextStyle( fontSize: 12.0.rem(), color: colors?.textWeaker)),
                    Text('0.00 ', style: TextStyle(fontSize: 12.0.rem(), color: colors?.textWarning)),
                    Text('(0.00/10.00)', style: TextStyle(fontSize: 12.0.rem(), color: colors?.textHighlightWhite)),
                  ],
                )
              ]
            )
          )
        ],
      )
    );
  }
}
