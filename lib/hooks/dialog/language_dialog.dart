import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/theme/variables/custom.dart';
import '/store/tenant/logic.dart';
import '/store/app/logic.dart';
import '/i18n/constants.dart';
import '/utils/screen.dart';
import '/i18n/type.dart';

Future<void> showLanguageDialog(BuildContext context) async {
  final tenantState = Get.find<TenantLogic>().state;
  final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>
  final appState = Get.find<AppLogic>().state;

  final langList = tenantState.tenantInfo.value.appLanguage?.map((item) {
    final lang = item.split('-');

    return {
      'languageCode': lang[0],
      'countryCode': lang[1],
      'languageName': languageCodeToName[lang[0]] ?? LOCALE.enUS.code,
      'countryName': countryCodeToName[lang[1]] ?? LOCALE.enUS.locale.countryCode,
    };
  }).toList();

  String? result = await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        backgroundColor: colors?.surfaceRaisedL1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0.rem()), // 设置你想要的圆角半径
        ),
        titlePadding: EdgeInsetsGeometry.symmetric(vertical: 20.0.rem()),
        contentPadding: EdgeInsets.zero,
        title: Center(
          child: Text('Choose Language', style: TextStyle(fontSize: 16.0.rem(), fontWeight: FontWeight.w600)),
        ),
        children: langList?.map((item) => SimpleDialogOption(
          padding: EdgeInsets.symmetric(horizontal: 10.0.rem()),
          onPressed: () {
            Navigator.pop(context, '${item["languageCode"]}-${item["countryCode"]}');
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: colors?.borderDefault ?? Colors.grey, // 边框颜色
                  width: 1.0, // 边框宽度
                ),
              ),
            ),
            // 设置内边距，防止内容紧贴边框
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${item["languageName"]} ${item["countryName"]}',
                  style: TextStyle(color: colors?.textDefault),
                ),
                if (item["languageCode"] == appState.locale.value.languageCode)
                  Container(
                    decoration: BoxDecoration(
                      color: colors?.textDefault,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle,
                      color: colors?.gradientsPrimaryA,
                      size: 16.0.rem(),
                    ),
                  ),
              ],
            ),
          ),
        )).toList(),
      );
    },
  );

  // 在这里处理用户的选择结果
  if (result != null) {
    final lang = result.split('-');
    appState.setLocale(Locale(lang[0], lang[1]));
  }
}