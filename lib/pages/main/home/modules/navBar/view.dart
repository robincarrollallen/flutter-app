import 'package:flutter/material.dart';
import '../../../../../utils/screen.dart';

class NavBarView extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const NavBarView({
    super.key,
    required this.scaffoldKey
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child:  Container(
            alignment: Alignment.centerLeft, // 控制图片在容器内的对齐方式
            child: Image.network(
              'https://upload-us.f-1-g-h.com/s3/1763076621057/480X112.png',
              height: 32.0.rem(),
              fit: BoxFit.contain,
            ),
          ),
        ),
        IconButton(
          iconSize: 24.0.rem(),
          icon: const Icon(Icons.menu),
          onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
        ),
      ],
    );
  }
}
