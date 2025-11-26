import 'package:flutter_app/i18n/translation.dart';
import 'package:flutter_app/pages/launch/view.dart';
import 'package:flutter_app/router/routes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'common/logic.dart';
import 'i18n/type.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 确保 Widgets binding 已初始化(有些插件 在 Widgets binding 初始化后才能被调用)
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final logic = Get.put(CommonLogic(), permanent: true); // permanent 常驻内存，直到应用关闭
  final state = Get.find<CommonLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GetMaterialApp(      // 使用Get库
      title: 'Flutter Demo',              // 项目名(web标签名)
      translations: AppTranslations(),    // 多语言
      locale: state.locale.value,         // 默认语言
      fallbackLocale: LOCALE.enUS.locale, // 备用语言
      theme: state.currentTheme.value,    // 设置主题(使用Obx可动态变更)
      getPages: Routes.getPages,          // 路由映射
      home: LaunchPage(),                 // 映射首页
    ));
  }
}
