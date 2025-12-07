import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Loading {
  static int _loadingCount = 0; // 使用计数器来管理 loading 状态

  /// 显示 Loading 每调用一次，计数器会 +1, 只有在计数器从 0 变为 1 时，才会真正显示 Dialog。
  static void show() {
    if (_loadingCount == 0) {
      // Future.delayed: build<优先紧急任务>完成后调用
      Future.delayed(Duration.zero, () {
        Get.dialog(
          const Center(
            child: CupertinoActivityIndicator(
              radius: 12.0,
            ),
          ),

          barrierDismissible: false, // 点击外部不关闭
        );
      });
    }

    _loadingCount++; // 每次调用增加计数
  }

  /// 隐藏 Loading, 每调用一次，计数器会 -1, 只有在计数器减到 0 时，才会真正关闭 Dialog。
  static void hide() {
    if (_loadingCount > 0) {
      _loadingCount--; // 减少引用计数
      if (_loadingCount == 0) {
        // Get.isDialogOpen 检查可以增加代码的健壮性
        if (Get.isDialogOpen ?? false) {
          Get.back();
        }
      }
    }
  }
}