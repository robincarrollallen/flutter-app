import 'package:flutter/material.dart';
import 'package:flutter_app/hooks/dialog/language_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/theme/variables/custom.dart';
import '/utils/screen.dart';

class NavBarView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavBarView({
    super.key,
    required this.scaffoldKey
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return Container(
      color: Color.fromRGBO(18, 23, 19, 1),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-1, -1),
            end: Alignment(.5, 6),
            colors: const [
              Color.fromRGBO(18, 23, 19, 0),         // 8%
              Color.fromRGBO(255, 255, 255, 0.06),   // 8%
              Color.fromRGBO(255, 255, 255, 0),      // 20%
              Color.fromRGBO(255, 255, 255, 0.05),   // 20%
              Color.fromRGBO(255, 255, 255, 0),      // 32%
              Color.fromRGBO(255, 255, 255, 0.04),   // 32%
              Color.fromRGBO(255, 255, 255, 0),      // 44%
              Color.fromRGBO(255, 255, 255, 0.03),   // 44%
              Color.fromRGBO(255, 255, 255, 0),      // 56%
              Color.fromRGBO(255, 255, 255, 0.02),   // 56%
              Color.fromRGBO(255, 255, 255, 0),      // 68%
              Color.fromRGBO(255, 255, 255, 0.01),   // 68%
              Color.fromRGBO(255, 255, 255, 0),      // 80%
            ],
            stops: const [
              0.08,
              0.08,
              0.20,
              0.20,
              0.32,
              0.32,
              0.44,
              0.44,
              0.56,
              0.56,
              0.68,
              0.68,
              0.80,
            ],
            tileMode: TileMode.clamp, // 定义了渐变区域之外如何平铺，这里设置为 clamp 表示延伸边缘颜色
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child:  Container(
                padding: EdgeInsets.symmetric(vertical: 10.0.rem()),
                height: 50.0.rem(),
                alignment: Alignment.centerLeft,
                child: Image.network(
                  'https://upload-us.f-1-g-h.com/s3/1763076621057/480X112.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 12.0.rem()),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: colors?.surfaceRaisedL2,
                  borderRadius: BorderRadius.circular(4.0.rem()),
                  border: Border.all(
                    color: colors?.borderDefault ?? Colors.white,
                    width: 1.0,
                  ),
                ),
                child: IconButton(
                  style: IconButton.styleFrom(
                    minimumSize: Size.zero, // 取消默认的最小尺寸
                    padding: EdgeInsets.all(6.0.rem()),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 让点击区域收缩到内容大小
                  ),
                  icon: SvgPicture.asset(
                    'assets/svg/earth.svg',
                    width: 20.0.rem(),
                    colorFilter: ColorFilter.mode(colors?.textDefault ?? Colors.white, BlendMode.srcIn),
                  ),
                  onPressed: () => { showLanguageDialog(context)},
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 12.0.rem()),
              decoration: BoxDecoration(
                color: colors?.surfaceRaisedL2,
                borderRadius: BorderRadius.circular(4.0.rem()),
                border: Border.all(
                  color: colors?.borderDefault ?? Colors.white,
                  width: 1.0,
                )
              ),
              child: IconButton(
                style: IconButton.styleFrom(
                  minimumSize: Size.zero,  // 取消默认的最小尺寸
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap, // 让点击区域收缩到内容大小
                ),
                icon: SvgPicture.asset(
                  'assets/svg/menu.svg',
                  width: 16.0.rem(),
                  colorFilter: ColorFilter.mode(colors?.iconDefault ?? Colors.white, BlendMode.srcIn),
                ),
                onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              )
            )
          ],
        ),
      ),
    );
  }
}
