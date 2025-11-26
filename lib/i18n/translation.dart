import 'package:get/get.dart';
import 'locale/en_us.dart';
import 'locale/zh_cn.dart';


class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'zh_CN': zhCN,
    'en_US': enUS,
  };
}