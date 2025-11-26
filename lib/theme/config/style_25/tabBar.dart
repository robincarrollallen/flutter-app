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
    icon: 'assets/images/svg/home-outline.svg',
    activeIcon: 'assets/images/svg/home-filled.svg',
    label: 'home',
  ),
  TabBarItem(
    icon: 'assets/images/svg/search-outline.svg',
    activeIcon: 'assets/images/svg/search-filled.svg',
    label: 'market',
  ),
  TabBarItem(
    icon: 'assets/images/svg/search-outline.svg',
    activeIcon: 'assets/images/svg/search-filled.svg',
    label: 'trade',
  ),
  TabBarItem(
    icon: 'assets/images/svg/message-outline.svg',
    activeIcon: 'assets/images/svg/message-filled.svg',
    label: 'favorite',
  ),
  TabBarItem(
    icon: 'assets/images/svg/user-outline.svg',
    activeIcon: 'assets/images/svg/user-filled.svg',
    label: 'mine',
  ),
];
