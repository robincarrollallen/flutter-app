import 'meta.dart';

/// 定义路由枚举 (配置中心)
enum AppRoute {
  // 首页
  home(
    path: '/',
    meta: RouteMeta(title: 'Home')
  ),
  // 支付密码
  payPassword(
    path: '/security/pay/password',
    meta: RouteMeta(title: 'PayPassword', auth: true)
  );

  final String path;
  final RouteMeta meta;

  /// 枚举构造函数
  const AppRoute({required this.path, required this.meta});

  /// 辅助方法：通过 path 查找对应的枚举
  static AppRoute? match(String path) {
    try {
      return AppRoute.values.firstWhere((e) => e.path == path);
    } catch (_) {
      return null;
    }
  }
}