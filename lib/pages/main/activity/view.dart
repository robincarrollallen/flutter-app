import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  final OverlayState? overlayState;
  const ActivityPage(this.overlayState, {super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
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
    return TextFormField(
      key: globalKey,
      focusNode: focusNode,
      decoration: InputDecoration(
          labelText: '交易'
      ),
    );
  }
}
