import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class VipTag extends StatelessWidget {
  final int level;
  final double fontSize;

  VipTag({
    super.key,
    this.level = 0,
    this.fontSize = 10,
  });

  late final vipLevel = level + 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Align(
            alignment: Alignment.centerRight,
            child: FractionallySizedBox(
              widthFactor: 1,
              child: AspectRatio(
                aspectRatio: 41 /10, // 设置宽高比
                child: SvgPicture.asset(
                  'assets/svg/vip/vipTextSvg$vipLevel.svg',
                ),
              ),
            ),
          )
        ),
        Row(
          children: [
            FractionallySizedBox(
              heightFactor: 1,
              child: Image.asset('assets/icons/vip/vip$vipLevel.webp'),
            ),
            Row(
              spacing: fontSize / 4,
              children: [
                Text('VIP', style: TextStyle(fontSize: fontSize)),
                Text('$level', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold))
              ],
            )
          ]
        )
      ],
    );
  }
}