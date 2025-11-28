class TabBarItem {
  final String label;          // 标签文字
  final String icon;           // 默认图标路径
  final String activeIcon;     // 选中图标路径

  const TabBarItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}

/// 底部导航栏元素列表
final List<TabBarItem> items = [
  TabBarItem(
    icon: 'assets/icons/tabBar/tab/home-25.webp',
    activeIcon: 'assets/icons/tabBar/tab/home-active-25.webp',
    label: 'home',
  ),
  TabBarItem(
    icon: 'assets/icons/tabBar/tab/promo-25.webp',
    activeIcon: 'assets/icons/tabBar/tab/promo-active-25.webp',
    label: 'market',
  ),
  TabBarItem(
    icon: '',
    activeIcon: '',
    label: '',
  ),
  TabBarItem(
    icon: 'assets/icons/tabBar/tab/enter-25.webp',
    activeIcon: 'assets/icons/tabBar/tab/enter-active-25.webp',
    label: 'favorite',
  ),
  TabBarItem(
    icon: 'assets/icons/tabBar/tab/profile-25.webp',
    activeIcon: 'assets/icons/tabBar/tab/profile-active-25.webp',
    label: 'mine',
  ),
];
