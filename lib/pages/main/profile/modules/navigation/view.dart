import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/i18n/constants.dart';
import '/theme/variables/custom.dart';
import '/components/navigation.dart';
import '/widgets/vip_wrap/view.dart';
import '/widgets/flag/view.dart';
import '/store/app/logic.dart';
import '/utils/screen.dart';
import 'logic.dart';

class ProfileNavigation extends StatelessWidget {
  ProfileNavigation({super.key});

  final logic = Get.put(ProfileNavigationLogic());
  final state = Get.find<ProfileNavigationLogic>().state;
  final appState = Get.find<AppLogic>().state;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(top: 12.0.rem()),
          child: VipWrap(),
        ),
        Container(
          margin: EdgeInsetsGeometry.symmetric(vertical: 12.0.rem()),
          decoration: BoxDecoration(
            color: colors?.surfaceRaisedL1,
            borderRadius: BorderRadius.circular(6.0.rem()),
          ),
          padding: EdgeInsetsGeometry.all(12.rem()),
          child: Navigation(
            prefix: SvgPicture.asset(
              'assets/svg/customer-service.svg',
              colorFilter: ColorFilter.mode(colors?.iconDefault ?? Colors.white, BlendMode.srcIn),
            ),
            title: Text('Support', style: TextStyle(fontWeight: FontWeight.w500, color: colors?.textDefault)),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: colors?.surfaceRaisedL1,
            borderRadius: BorderRadius.circular(6.0.rem()),
          ),
          child: Column(
            children: state.links.map((item) => Padding(
              padding: EdgeInsets.all(12.0.rem()),
              child: Navigation(
                onPressed: () => { logic.handleNavigation(item['link']!) },
                prefix: SvgPicture.asset(
                  item['icon']!,
                  colorFilter: ColorFilter.mode(colors?.iconWeaker ?? Colors.white, BlendMode.srcIn),
                ),
                title: Text(item['title']!, style: TextStyle(fontWeight: FontWeight.w500, color: colors?.textDefault)),
                content: item['title'] == 'Language'
                ? Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flag(countryCode: '${appState.locale.value.countryCode}'),
                      Text(
                        '${languageCodeToName[appState.locale.value.languageCode]} ${countryCodeToName[appState.locale.value.countryCode]}',
                        style: TextStyle(color: colors?.textDefault),
                      ),
                    ],
                  )
                : null
              ),
            )).toList()
          ),
        ),
        // 底部占位
        SizedBox(
          height: MediaQuery.of(context).padding.bottom
        ),
      ]
    );
  }
}