import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../enums/screen.dart';

/// 扩展 rem，用于宽度适配 + 最小值/最大值限制
extension LimitExtension on num {
  double rem({
    double? minScreenWidth,
    double? maxScreenWidth,
  }) {
    final double currentScreenWidth = ScreenUtil().screenWidth; // 获取当前屏幕宽度

    final double minLimit = minScreenWidth ?? SCREEN.MOBILE_MIN_WIDTH.size; // 如果外部没有传入值，则使用枚举中的默认值
    final double maxLimit = maxScreenWidth ?? SCREEN.MOBILE_MAX_WIDTH.size; // 如果外部没有传入值，则使用枚举中的默认值

    final double effectiveScreenWidth = currentScreenWidth.clamp(minLimit, maxLimit); // 确定用于计算的有效屏幕宽度，将其限制在最小和最大宽度之间

    // 基于有效屏幕宽度和设计稿宽度，计算缩放比例
    if (effectiveScreenWidth != currentScreenWidth) {
      final double correctionFactor = effectiveScreenWidth / currentScreenWidth; // 计算校正比例：用“有效宽度”除以“实际宽度”

      return this.w * correctionFactor; // 将 screenutil 正常计算出的尺寸 (.w) 乘以这个校正比例
    }

    // 使用 this (原始数值) 乘以计算出的缩放比例，得到最终限制后的尺寸
    return this.w;
  }
}