import 'package:get/get_navigation/src/routes/get_route.dart';
import '../pages/main/view.dart';

class Routes {
  static List<GetPage> getPages = [
    GetPage (                                 // 主页(tabbar)
      name: "/",                              // 路由名称
      page: () => const MyHomePage()          // 映射的页面
    ),
  ];
}