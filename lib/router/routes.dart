import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '/pages/withdraw/password/view.dart';
import '/pages/main/view.dart';
import 'middleware.dart';
import 'route.dart';


class Routes {
  static GetPage _page(AppRoute route, Widget Function() page) {
    return GetPage(
      name: route.path, // 路由名称
      page: page, // 映射的页面
      middlewares: [
        if (route.meta.auth) AuthMiddleware(), // 如果枚举里配置了 auth: true，自动追加 AuthMiddleware
      ],
    );
  }

  static List<GetPage> getPages = [
    _page(AppRoute.home, () => const MyHomePage()), // 主页
    _page(AppRoute.payPassword, () => const PayPasswordPage()), // 支付密码
  ];
}