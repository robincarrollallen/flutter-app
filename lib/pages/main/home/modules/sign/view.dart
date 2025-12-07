import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/hooks/dialog/language_dialog.dart';
import 'package:flutter_app/hooks/dialog/login_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../theme/variables/custom.dart';
import '../../../../../utils/screen.dart';

class SignView extends StatelessWidget {
  const SignView({super.key});

  @override
  Widget build(BuildContext context) {
    final double skewAngle = -12 * (pi / 180); // 倾斜角度
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0.rem()),
      child: Stack(
        children: [
          Padding(padding: EdgeInsets.only(left: 40.0.rem(), right: 20.0.rem()),
            child: Transform(
              transform: Matrix4.skewX(skewAngle),
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(right: 14.0.rem()),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: colors?.borderDefault ?? Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12.0.rem()),
                ),
                height: 60.0.rem(),
                child: Row(
                  spacing: 8.0.rem(),
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () { showLoginSheet(context); },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero, // 移除内边距
                        minimumSize: Size.zero, // 移除最小尺寸约束
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 移除额外点击区域
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0.rem()), // 确保按钮的形状和 Ink 的形状一致
                        ),
                        side: BorderSide.none, // 关键：移除按钮自身的边框，因为它会被child覆盖
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              colors?.gradientsPrimaryA ?? Colors.blue,
                              colors?.gradientsPrimaryB ?? Colors.lightBlue,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: const [-0.27, 1.27],
                          ),
                          border: Border.all(
                            color: colors?.btnLevel2Border ?? Colors.grey, // 边框颜色
                            width: 2.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(4.0.rem()), // 确保圆角一致
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: 76.0.rem(), // <--- 在这里设置你想要的最小宽度
                          ),
                          height: 30.0.rem(),
                          alignment: Alignment.center,
                          child: Text(
                            'Login',
                            style: TextStyle(fontWeight: FontWeight.w600, color: colors?.textDefault)
                          ),
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero, // 移除内边距
                        minimumSize: Size.zero, // 移除最小尺寸约束
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 移除额外点击区域
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0.rem()), // 确保按钮的形状和 Ink 的形状一致
                        ),
                        side: BorderSide.none, // 关键：移除按钮自身的边框，因为它会被child覆盖
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              colors?.inverse600 ?? Colors.blue,
                              colors?.inverse500 ?? Colors.lightBlue,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            stops: const [-0.27, 1.27],
                          ),
                          border: Border.all(
                            color: colors?.btnLevel3Border ?? Colors.grey, // 边框颜色
                            width: 2.0, // 边框宽度
                          ),
                          borderRadius: BorderRadius.circular(4.0.rem()), // 确保圆角一致
                        ),
                        child: Container(
                          constraints: BoxConstraints(
                            minWidth: 76.0.rem(), // <--- 在这里设置你想要的最小宽度
                          ),
                          height: 30.0.rem(),
                          alignment: Alignment.center,
                          child: Text(
                            'Register',
                            style: TextStyle(fontWeight: FontWeight.w600, color: colors?.textDefault)
                          ),
                        ),
                      ),
                    ),
                  ]
                )
              ),
            ),
          ),
          Positioned.fill(
            left: 20.0.rem(),
            child: Row(
              spacing: 8.0.rem(),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.0.rem()),
                  child: Container(
                    padding: EdgeInsets.all(8.0.rem()),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ?colors?.gradientsPrimaryA, // 起始颜色
                          ?colors?.gradientsPrimaryB, // 结束颜色
                        ],
                        begin: Alignment.centerLeft, // 渐变起始位置
                        end: Alignment.centerRight, // 渐变结束位置
                        stops: [-0.27, 1.27],
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/svg/person-25.svg',
                      width: 16.0.rem(),
                      height: 16.0.rem(),
                    )
                  ),
                ),
                Text('Welcome', style: TextStyle(fontSize:16.0.rem(), fontWeight: FontWeight.w600))
              ],
            ),
          )
        ]
      )
    );
  }
}
