import 'package:flutter/material.dart';

/// 一个使用 Stack 和 Positioned (定位方式) 实现的精灵图组件。
/// 这种方法非常直观，且能避免 Transform 的对齐和剪切问题。
class Sprite extends StatelessWidget {
  /// 图标最终在屏幕上显示的逻辑尺寸。
  final Size size;

  /// 精灵图的资源路径。
  final String imagePath;

  /// 整个精灵图的 **逻辑尺寸** (1x 尺寸)。
  final Size imageFullSize;

  /// 要显示的图标在精灵图 **逻辑坐标系** 中的左上角坐标 (1x 坐标)。
  final Offset offset;

  /// 图像的缩放比例。对于2倍图，传入 2.0。
  final double scale;

  const Sprite({
    super.key,
    required this.size,
    required this.imagePath,
    required this.imageFullSize,
    required this.offset,
    this.scale = 1.0, // 默认为1.0 (非高清图)
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: size.width,
      height: size.height,
      child: ClipRect(
        child: Stack(
          children: [
            // Positioned 用于精确定位 Stack 中的子组件
            Positioned(
              // 关键: 将图片向左、向上移动指定的偏移量
              left: -offset.dx,
              top: -offset.dy,
              // 容器2: 强制规定 Image 组件的逻辑尺寸
              child: SizedBox(
                width: imageFullSize.width,
                height: imageFullSize.height,
                child: Image.asset(
                  imagePath,
                  scale: scale, // 负责处理 @2x/@3x 图的尺寸映射
                  fit: BoxFit.none, // 确保是像素级的平移，而不是缩放
                  gaplessPlayback: true, // 切换时防止闪烁
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}