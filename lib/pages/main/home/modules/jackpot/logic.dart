import 'dart:async';
import 'package:get/get.dart';
import 'state.dart';

class JackpotLogic extends GetxController {
  final JackpotState state = JackpotState();

  Timer? _timer;

  /// 生命周期: 初始化
  @override
  void onInit() {
    super.onInit();

    _startTimer();
  }

  @override
  void onClose() {
    _timer?.cancel(); // 页面销毁时取消定时器，防止内存泄漏

    super.onClose();
  }

  /// 启动定时器
  void _startTimer() {
    // 创建定时器，每3秒获取时间戳
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      int timestamp = DateTime.now().millisecondsSinceEpoch; // 获取当前时间的13位毫秒时间戳

      int lastNineDigits = timestamp % 1000000000; // 取后九位数 (通过取模运算实现)

      double result = lastNineDigits / 100.0; // 除以100，得到浮点数

      state.setBonusValue(result); // 设置奖金池金额
    });
  }
}