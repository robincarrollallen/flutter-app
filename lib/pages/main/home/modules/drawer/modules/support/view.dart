import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import '/components/picture.dart';
import '/utils/screen.dart';
import 'logic.dart';

class DrawerSupportView extends StatelessWidget {
  DrawerSupportView({ super.key });

  final logic = Get.put(DrawerSupportLogic());
  final state = Get.find<DrawerSupportLogic>().state;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return GetBuilder<DrawerSupportLogic>(
      builder: (_) {
        return Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 8.0.rem()),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: colors?.bodyDefault ?? Colors.grey),
              )
            ),
            padding: EdgeInsets.only(top: 12.0.rem(), left: 12.0.rem(), right: 12.0.rem()),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    spacing: 4.0.rem(),
                    children: [
                      SvgPicture.asset(
                        'assets/svg/support.svg',
                        width: 24.0.rem(),
                        height: 24.0.rem(),
                        colorFilter: ColorFilter.mode(colors?.textDefault ?? Colors.grey, BlendMode.srcIn)
                      ),
                      Text('Support'),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 4.0.rem(),
                      children: state.mainMediaList.map((item) {
                        return Container(
                          padding: EdgeInsets.all(4.0.rem()),
                          decoration: BoxDecoration(
                            color: Color(0x2aabee33),
                            shape: BoxShape.circle,
                          ),
                          height: 28.0.rem(),
                          width: 28.0.rem(),
                          child: ClipOval(
                            child: Picture('${item.icon}', fit: BoxFit.cover),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              ],
            ),
          )
        );
      }
    );
  }
}