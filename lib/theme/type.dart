/// 主题枚举
enum THEME {
  light('light', 'light'),
  dark('dark', 'dark'),
  custom('custom', 'custom'),
  style25('style25', 'Layout2:SupremeGreen');

  final String key;
  final String name;

  const THEME(this.key, this.name);

  /// 根据 name 字符串查找 THEME 枚举成员。[name] 要查找的字符串，例如 'Layout2:SupremeGreen'
  static THEME fromName(String name) {
    return THEME.values.firstWhere(
      (theme) => theme.name == name,
      /// 如果找不到匹配的成员，会抛出异常。
      orElse: () =>
        throw ArgumentError('未找到name为 "$name" 的主题'),
    );
  }

  /// 根据 key 字符串查找 THEME 枚举成员。[key] 要查找的字符串，例如 'style25'
  static THEME fromKey(String key) {
    return THEME.values.firstWhere(
          (theme) => theme.key == key,
      /// 如果找不到匹配的成员，会抛出异常。
      orElse: () =>
      throw ArgumentError('未找到key为 "$key" 的主题'),
    );
  }
}