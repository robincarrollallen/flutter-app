import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../theme/config/style_25/tabBar.dart';
import '../../../theme/variables/custom.dart';

/// 生成底部导航栏列表
List<BottomNavigationBarItem> buildBarItems(BuildContext context) {
  final colors = Theme.of(context).extension<CustomColors>();

  return items.map((item) {
    return BottomNavigationBarItem(
      label: item.label.tr,
      icon: _buildTradeIconWithBadge(item.icon, colors?.navigationDefault),
      activeIcon: _buildTradeIconWithBadge(item.activeIcon, colors?.navigationSelected),
    );
  }).toList();
}

/// 构建底部导航栏图标(带角标)
Widget _buildTradeIconWithBadge(String iconPath, Color? iconColor) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      SvgPicture.asset(
        iconPath,
        width: 22,
        colorFilter: ColorFilter.mode(iconColor ?? Colors.grey, BlendMode.srcIn),
      ),
      Positioned(
        top: -6.0,
        right: -10.0,
        child: Container(
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(6),
          ),
          constraints: const BoxConstraints(
            minWidth: 12,
            minHeight: 12,
          ),
          child: const Text(
            '101',
            style: TextStyle(
              color: Colors.white,
              fontSize: 8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ],
  );
}