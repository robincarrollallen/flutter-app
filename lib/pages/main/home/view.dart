import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  final OverlayState? overlayState;
  const HomePage(this.overlayState, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode focusNode = FocusNode();
  final GlobalKey globalKey = GlobalKey();
  late OverlayEntry overlayEntry;
  RenderBox? renderBox;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      renderBox = globalKey.currentContext?.findRenderObject() as RenderBox;
      overlayEntry = createOverlayEntry();
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        widget.overlayState?.insert(overlayEntry);
      } else {
        overlayEntry.remove();
      }
    });

    super.initState();
  }

  OverlayEntry createOverlayEntry() {
    var size = renderBox?.size;
    var offset = renderBox?.localToGlobal(Offset.zero);
    return OverlayEntry(
        builder: (context) => Positioned(
          left: offset?.dx,
          top: offset!.dy + size!.height + 5.0,
          width: size.width,
          child: Material(
            elevation: 4.0,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  title: Text('Syria'),
                ),
                ListTile(
                  title: Text('Lebanon'),
                )
              ],
            ),
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            '自适应文字',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.rem(), // 使用 .sp 替代 24
            ),
          ),
        ),
      )
    );
  }
}
