import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// 一个特殊的响应式变量，它会自动将其状态持久化到 GetStorage, [T]: 是变量的类型，例如 int, String, bool 等
class PersistentRx<T> extends Rx<T> {
  static final GetStorage _storage = GetStorage(); // 存储实例

  final String _key; // 用于存储的键

  /// 构造函数 [key]: 用于在 GetStorage 中存储此变量的唯一键, [initial]: 如果存储中没有值，则使用的初始值。
  PersistentRx(this._key, T initial) : super(initial) {
    // 1. 初始化：从存储中读取值
    final storedValue = _storage.read<T>(_key);
    if (storedValue != null) {
      value = storedValue; // 如果存在，则更新当前值
    } else {
      value = initial; // 否则使用初始值
    }

    // 2. 自动保存：监听值的变化，并自动写入存储
    ever(this, (newValue) {
      _storage.write(_key, newValue);
    });
  }
}