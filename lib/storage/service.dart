
import 'package:get/get.dart';
import './persistent.dart';

class StorageService extends GetxService {

  final counter = PersistentRx<int>('counter', 0);
  final isDarkMode = PersistentRx<bool>('isDarkMode', false);
  final username = PersistentRx<String>('username', '');

  // onInit() 方法现在是空的，因为所有逻辑都在 Persistent 内部处理了！∂
  @override
  void onInit() {
    super.onInit();
  }

  void incrementCounter() {
    counter.value++;
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  void login(String name) {
    username.value = name;
  }

  void logout() {
    username.value = '';
  }
}