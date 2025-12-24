import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class CounterController extends GetxController with GetTickerProviderStateMixin {
  // 当前显示的数字
  RxDouble currentValue = 0.0.obs;

  // 内部 Ticker 用于每帧累加
  late Ticker _ticker;

  double _targetValue = 0.0;
  double _incrementPerFrame = 0.0;

  final NumberFormat formatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$',
    decimalDigits: 2,
  );

  @override
  void onInit() {
    super.onInit();
    _ticker = createTicker(_onTick);
  }

  void _onTick(Duration elapsed) {
    if (currentValue.value < _targetValue) {
      currentValue.value += _incrementPerFrame;
      if (currentValue.value >= _targetValue) {
        currentValue.value = _targetValue;
        _ticker.stop();
      }
    } else {
      _ticker.stop();
    }
  }

  /// 更新数字目标值，durationInSeconds 控制累加动画时间
  void updateValue(double newValue, {double durationInSeconds = 1.0}) {
    _targetValue = newValue;
    final totalFrames = 60 * durationInSeconds; // 假设 60fps
    _incrementPerFrame = (_targetValue - currentValue.value) / totalFrames;
    _ticker.start();
  }

  String formattedValue() => formatter.format(currentValue.value);

  @override
  void onClose() {
    _ticker.dispose();
    super.onClose();
  }
}

class GetXFrameCountUpDemo extends StatelessWidget {
  const GetXFrameCountUpDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: const Text("GetX 数字累加动画")),
      body: Center(
        child: Obx(() => Text(
          controller.formattedValue(),
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.updateValue(controller.currentValue.value + 1234.56, durationInSeconds: 1.0);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
