import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import '/utils/screen.dart';
import '../../logic.dart';

class PwaView extends StatelessWidget {
  PwaView ({ super.key });

  final logic = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return Row(
      children: [
        InkWell(
          onTap: () => { logic.hidePwa() },
          child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 4.0.rem(), left: 4.0.rem()),
                  width: 34.0.rem(),
                  height: 50.0.rem(),
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Icon(Icons.close, size: 16.0.rem()),
                  ),
                ),
                Positioned(
                    top: -22.0.rem(),
                    left: -22.0.rem(),
                    child: ClipOval(
                      child: Container(
                        color: colors?.neutralWhiteWhite10,
                        width: 50.0.rem(),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                        ),
                      ),
                    )
                )
              ]
          ),
        ),
        Container(
          height: 50.0.rem(),
          margin: EdgeInsets.only(right: 6.0.rem()),
          alignment: Alignment.centerLeft,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: SizedBox(
                height: 38.0.rem(),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.network(
                    'https://upload-us.b83.xyz/1719570695193/Snipaste.png',
                    fit: BoxFit.contain,
                  ),
                ),
              )
          ),
        ),
        Expanded(
          child: Text('Download Our APP, Win Super Prizes!'),
        ),
        Image.asset(
          'assets/icons/home/pwa-money.webp',
          height: 24.0.rem(),
          width: 56.0.rem(),
        ),
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 12.0.rem()),
          child: InkWell(
            onTap: () {
              print('Install button tapped!');
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0.rem(), vertical: 6.0.rem()),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colors?.gradientsTertiaryA ?? Colors.transparent,
                    colors?.gradientsTertiaryB ?? Colors.transparent,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                // 设置圆角
                borderRadius: BorderRadius.circular(6.0.rem()),
              ),
              child: Text(
                'Install',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0.rem(),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}