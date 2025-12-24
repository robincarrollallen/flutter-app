import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import '/widgets/vip_tag/view.dart';
import '/utils/screen.dart';
import '/hooks/copy.dart';
import 'logic.dart';

class UserInfo extends StatelessWidget {
  UserInfo({super.key});

  final logic = Get.put(UserInfoLogic());

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return Column(
      spacing: 20.0.rem(),
      children: [
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 12.0.rem()),
          child: Column(
            children: [
              Row(
                spacing: 16.rem(),
                children: [
                  CircleAvatar(
                    radius: 27.rem(),
                    backgroundImage: NetworkImage('https://upload-dev.b83.xyz/avatar/first_male_1.jpg'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 8.0.rem(),
                        children: [
                          Text('9951843154', style: TextStyle(fontSize: 14.0.rem(), fontWeight: FontWeight.w600)),
                          SizedBox(
                            width: 64.rem(),
                            height: 24.rem(),
                            child: VipTag(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('ID: ${"13512153151"}', style: TextStyle(fontSize: 12.0.rem())),
                          IconButton(
                            onPressed: () => {copyToClipboard(context, '13512153151')},
                            style: IconButton.styleFrom(
                              minimumSize: Size.zero,  // 取消默认的最小尺寸
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 让点击区域收缩到内容大小
                            ),
                            icon: Icon(Icons.copy, size: 16.0.rem(), color: colors?.iconBrandPrimary)
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          height: 56.rem(),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: BoxBorder.fromLTRB(bottom: BorderSide(color: colors?.borderDefault ?? Colors.grey)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none, // 允许子元素溢出
                  children: [
                    Positioned(
                      top: 40.rem(),
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 48, sigmaY: 48),
                          child: Container(
                            width: 100.rem(),
                            height: 100.rem(),
                            decoration: BoxDecoration(
                              color: colors?.glowPrimaryOpacity40,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      spacing: 6.0.rem(),
                      children: [
                        Text('Balance', style: TextStyle(fontSize: 10.0.rem())),
                        Row(
                          spacing: 4.0.rem(),
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("R\$", style: TextStyle(color: colors?.textWarning, fontSize: 16.0.rem(), fontWeight: FontWeight.bold)),
                            Text('10,000.00', style: TextStyle(fontSize: 16.0.rem(), fontWeight: FontWeight.bold)),
                            Padding(
                              padding: EdgeInsetsGeometry.only(left: 10.0.rem()),
                              child: IconButton(
                                style: IconButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                onPressed: () => {},
                                icon: Icon(Icons.cached, size: 16.0.rem(), color: colors?.iconDefault)
                              ),
                            )
                          ]
                        )
                      ],
                    ),
                  ],
                )
              ),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none, // 允许子元素溢出
                  children: [
                    Positioned(
                      top: 40.rem(),
                      left: 0,
                      right: 0,
                      child: Center(
                        child: ImageFiltered(
                          imageFilter: ImageFilter.blur(sigmaX: 48, sigmaY: 48),
                          child: Container(
                            width: 100.rem(),
                            height: 100.rem(),
                            decoration: BoxDecoration(
                              color: colors?.glowPrimaryOpacity40,
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      spacing: 6.0.rem(),
                      children: [
                        Text('The bonus received today', style: TextStyle(fontSize: 10.0.rem())),
                        Text('18.97', style: TextStyle(fontSize: 16.0.rem(), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                )
              )
            ]
          ),
        ),
        Row(
          spacing: 12.0.rem(),
          children: [
            Expanded(
              child: Container(
                height: 40,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: colors?.surfaceRaisedL2,
                  borderRadius: BorderRadius.circular(6.0.rem()), // 圆角
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.3, 1.0],
                      colors: [
                        Colors.transparent,
                        Colors.transparent,
                        colors?.glowSecondaryOpacity40 ?? Colors.purple.withValues(alpha: 0.4),
                      ],
                    ),
                  ),
                  child: Row(
                    spacing: 6.0.rem(),
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/svg/pig.svg', width: 30.0.rem(), height: 30.0.rem(), colorFilter: ColorFilter.mode(colors?.iconBrandPrimary ?? Colors.grey, BlendMode.srcIn)),
                      Text(
                        'Deposit',
                        style: TextStyle(
                          color: colors?.textDefault,
                          fontSize: 14.0.rem(),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => { logic.handleWithdraw(context) },
                child: Container(
                  height: 40.0.rem(),
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: colors?.surfaceRaisedL2,
                    borderRadius: BorderRadius.circular(6.0.rem()), // 圆角
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 0.3, 1.0],
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          colors?.glowSecondaryOpacity40 ?? Colors.purple.withValues(alpha: 0.4),
                        ],
                      ),
                    ),
                    child: Row(
                      spacing: 6.0.rem(),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/wallet.svg', width: 30.0.rem(), height: 30.0.rem(), colorFilter: ColorFilter.mode(colors?.iconBrandPrimary ?? Colors.grey, BlendMode.srcIn)),
                        Text(
                          'Withdraw',
                          style: TextStyle(
                            color: colors?.textDefault,
                            fontSize: 14.0.rem(),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ),
          ],
        )
      ],
    );
  }
}