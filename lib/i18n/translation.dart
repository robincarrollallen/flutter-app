import 'package:get/get.dart';
import 'locale/en_us.dart';
import 'locale/pt_br.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'pt_BR': ptBR,
    'en_US': enUS,
  };
}