import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'i18n/type.dart';
import 'enums/screen.dart';
import 'common/logic.dart';
import 'router/routes.dart';
import 'i18n/translation.dart';
import 'pages/launch/view.dart';

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
    return ScreenUtilInit(
      designSize: Size(
        SCREEN.MOBILE_DESIGN_WIDTH.size,      // 规定窗口使用的宽度基础值
        SCREEN.MOBILE_DESIGN_HEIGHT.size      // 规定窗口使用的高度基础值
      ),
      minTextAdapt: true,                     // 文本最小值适配
      splitScreenMode: true,                  // 支持分屏模式
      builder: (context, child) {
        return Obx(() => GetMaterialApp(      // 使用Get库
          title: 'Flutter Demo',              // 项目名(web标签名)
          translations: AppTranslations(),    // 多语言
          locale: state.locale.value,         // 默认语言
          fallbackLocale: LOCALE.enUS.locale, // 备用语言
          theme: state.currentTheme.value,    // 设置主题(使用Obx可动态变更)
          getPages: Routes.getPages,          // 路由映射
          home: LaunchPage(),                 // 映射首页
        ));
      },
    );
  }
}
