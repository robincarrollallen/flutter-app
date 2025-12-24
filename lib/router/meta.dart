/// 定义 Meta 数据模型
class RouteMeta {
  final String title;
  final bool auth; // 是否需要登录

  const RouteMeta({
    required this.title,
    this.auth = false
  });
}