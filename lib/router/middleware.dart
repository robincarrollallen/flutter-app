import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'route.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 1; // 路由中间件优先级，数字越小越先执行

  @override
  RouteSettings? redirect(String? route) {
    final matchedRoute = AppRoute.match(route ?? ''); // 根据即将跳转的路径，查找枚举配置

    if (matchedRoute != null && matchedRoute.meta.auth) {
      // TODO 检测是否登陆
      bool isLogin = true;

      if (!isLogin) {
        // 未来登陆操作
      } else {
        return null;
      }
    }

    return null; // 返回 null 代表允许正常通过
  }
}