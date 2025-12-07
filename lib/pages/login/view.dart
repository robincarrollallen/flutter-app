import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import '/utils/screen.dart';
import 'logic.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  
  final logic = Get.put(LoginLogic());

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: 486.0
      ),
      child: SizedBox(
        width: double.infinity, // 尽可能宽，受 maxWidth 限制
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0, // 取消阴影
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0.rem()),
                      height: 50.0.rem(),
                      alignment: Alignment.centerLeft,
                      child: Image.network(
                        'https://upload-us.f-1-g-h.com/s3/1763076621057/480X112.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  IconButton(
                    style: ButtonStyle(
                      minimumSize: WidgetStateProperty.all(Size.square(30.0.rem())), // 设置最小尺寸
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0.rem()), // 调整圆角
                        ),
                      ),
                      backgroundColor: WidgetStateProperty.all(colors?.neutralWhiteWhite20)
                    ),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.close, size: 16.0.rem(), color: colors?.iconDefault)
                  ),
                ],
              ),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 50.0.rem()),
              decoration: BoxDecoration(
                color: colors?.surfaceRaisedL1,
                border: Border(top: BorderSide(
                  color: colors?.glowPrimaryOpacity100 ?? Colors.grey,
                  width: 2.0.rem())
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0.rem()),
                  topRight: Radius.circular(20.0.rem())
                )
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0.rem(), vertical: 44.0.rem()),
                children: [
                  Text(
                    'Log in to your account',
                    style: TextStyle(
                      fontSize: 24.0.rem(),
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Row(
                    children: [
                      Text("Don't have an account ?",
                        style: TextStyle(color: colors?.textWeaker)),
                      TextButton(
                        onPressed: () {},
                        child: Text('Register', style: TextStyle(
                          color: colors?.textHighlight)
                        )
                      ),
                    ],
                  ),
                  Center(
                    child: IntrinsicWidth(
                      child: Container(
                        margin: EdgeInsets.only(top: 44.rem()),
                        padding: EdgeInsetsGeometry.all(2.rem()),
                        decoration: BoxDecoration(
                          color: colors?.surfaceLowered,
                          borderRadius: BorderRadius.circular(8.rem()),
                        ),
                        child: TabBar(
                          dividerHeight: 0.0,
                          controller: logic.tabController,
                          indicator: BoxDecoration(
                            color: colors?.surfaceRaisedL2, // 高亮背景色
                            borderRadius: BorderRadius.circular(8.rem()),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab, // 指示器大小跟随 tab
                          labelColor: colors?.textSelected, // 选中文字颜色
                          isScrollable: true,  // 开启滚动<宽度内容撑开>
                          tabAlignment: TabAlignment.start, // 标签元素左对齐<消除左侧边距>
                          unselectedLabelColor: colors?.textWeaker, // 未选中文字颜色
                          tabs: [
                            SizedBox(
                              width: 100,
                              child: Tab(text: 'Account', height: 38.0.rem()),
                            ),
                            SizedBox(
                              width: 100,
                              child: Tab(text: 'Phone', height: 38.0.rem()),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12.0.rem()),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.rem()),
                      gradient: LinearGradient(
                        colors: [
                          colors?.gradientsPrimaryA ?? Colors.blue,
                          colors?.gradientsPrimaryB ?? Colors.lightBlue,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: const [-0.27, 1.27],
                      ),
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {},
                        child: Text('Login', style: TextStyle(fontSize: 14.0.rem(), color: colors?.textDefault))
                      ),
                    )
                  ),
                ]
              ),
            )
          ),
        ),
      ),
    );
  }
}