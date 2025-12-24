import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class Flag extends StatelessWidget {
  final String countryCode;
  final double size;

  const Flag({
    super.key,
    this.countryCode = 'US',
    this.size = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size),
      ),
      child: SvgPicture.asset(
        'assets/svg/flag/${countryCode.toLowerCase()}.svg',
        fit: BoxFit.fill,
      )
    );
  }
}