import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class VipBackground extends StatelessWidget {
  final Color startColor;
  final Color endColor;
  final Widget? child;

  const VipBackground({
    super.key,
    this.startColor = const Color(0xFF492B9D),
    this.endColor = const Color(0xFF5C2270),
    this.child,
  });

  String _colorToHex(Color color) {
    return '#${color.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }

  @override
  Widget build(BuildContext context) {
    final svgString = '''
      <svg viewBox="0 0 367 181" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M15 0C7.26801 0 1 6.26801 1 14V166C1 173.732 7.268 180 15 180H353C360.732 180 367 173.732 367 166V59.75C367 52.018 360.732 45.75 353 45.75H262.091C256.065 45.75 250.715 41.894 248.809 36.1772L239.941 9.57281C238.035 3.85602 232.685 0 226.659 0H15Z" fill="url(#paint0_linear_16242_8982)"/>
        <g opacity="0.2">
          <mask id="mask0_16242_8982" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="367" height="181">
            <path d="M14.4824 0.869141C6.75043 0.869141 0.482422 7.13715 0.482422 14.8691V166.869C0.482422 174.601 6.75043 180.869 14.4824 180.869H352.482C360.214 180.869 366.482 174.601 366.482 166.869V60.6191C366.482 52.8872 360.214 46.6191 352.482 46.6191H261.573C255.547 46.6191 250.197 42.7631 248.291 37.0463L239.423 10.442C237.518 4.72516 232.168 0.869141 226.142 0.869141H14.4824Z" fill="url(#paint1_linear_16242_8982)"/>
          </mask>
          <g mask="url(#mask0_16242_8982)">
            <circle opacity="0.3" cx="282.929" cy="14.3072" r="110.121" transform="rotate(150 282.929 14.3072)" fill="url(#paint2_linear_16242_8982)"/>
            <circle opacity="0.3" cx="81.5092" cy="190.786" r="110.121" transform="rotate(22.5601 81.5092 190.786)" fill="url(#paint3_linear_16242_8982)"/>
          </g>
        </g>
        <defs>
          <linearGradient id="paint0_linear_16242_8982" x1="308" y1="20" x2="0.999992" y2="180" gradientUnits="userSpaceOnUse">
            <stop stop-color="${_colorToHex(startColor)}"/>
            <stop offset="1" stop-color="${_colorToHex(endColor)}"/>
          </linearGradient>
          <linearGradient id="paint1_linear_16242_8982" x1="307.482" y1="20.8691" x2="0.482414" y2="180.869" gradientUnits="userSpaceOnUse">
            <stop stop-color="#104D61"/>
            <stop offset="1" stop-color="#0E3562"/>
          </linearGradient>
          <linearGradient id="paint2_linear_16242_8982" x1="78.6952" y1="9.90798" x2="392.702" y2="-33.967" gradientUnits="userSpaceOnUse">
            <stop stop-color="#BBF4FC" stop-opacity="0"/>
            <stop offset="1" stop-color="#AAAAAA"/>
          </linearGradient>
          <linearGradient id="paint3_linear_16242_8982" x1="83.0521" y1="83.1722" x2="109.666" y2="179.022" gradientUnits="userSpaceOnUse">
            <stop stop-color="#AAAAAA"/>
            <stop offset="1" stop-color="#BFF0FF" stop-opacity="0"/>
          </linearGradient>
        </defs>
      </svg>
    ''';

    return SizedBox(
      width: double.infinity,
      child: SvgPicture.string(
        svgString,
        fit: BoxFit.fill,
      )
    );
  }
}