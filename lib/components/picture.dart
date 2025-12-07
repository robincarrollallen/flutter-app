import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Picture extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  const Picture(
    this.src, {
      super.key,
      this.width,
      this.height,
      this.fit = BoxFit.contain,
      this.color,
    }
  );

  bool get _isSvg => src.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    // SVG
    if (_isSvg) {
      return SvgPicture.network(
        src,
        width: width,
        height: height,
        fit: fit,
        colorFilter:
        color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
      );
    }

    // PNG/JPG/WebP 等
    return Image.network(
      src,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}
