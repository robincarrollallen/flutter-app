import 'package:flutter/material.dart';
import 'package:flutter_app/utils/screen.dart';
import '/theme/variables/custom.dart';

class ConfirmDialog extends StatelessWidget {
  final String? title;
  final String content;
  final String confirmText;
  final String cancelText;
  final Color? confirmColor;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool showCancel;

  const ConfirmDialog({
    super.key,
    this.title,
    required this.content,
    this.confirmText = 'Confirm',
    this.cancelText = 'Cancel',
    this.confirmColor,
    this.onConfirm,
    this.onCancel,
    this.showCancel = false,
  });

  /// 静态方法方便调用
  static Future<bool?> show(
      BuildContext context, {
        String? title,
        required String content,
        String confirmText = '确认',
        String cancelText = '取消',
        Color? confirmColor,
        bool barrierDismissible = true,
      }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: Colors.black54,
      builder: (context) => ConfirmDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        cancelText: cancelText,
        confirmColor: confirmColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70.0.rem()),
              width: 340.0.rem(),
              decoration: BoxDecoration(
                color: colors?.surfaceRaisedL1,
                borderRadius: BorderRadius.circular(12.0.rem()),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                spacing: 24,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 100.0.rem(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12.0.rem())),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.0075, 0.4751, 0.9919],
                        colors: [
                          Color(0xFF74DBFE),
                          Color(0xFF8BB7FF),
                          Color(0xFFCB89FE),
                        ],
                      ),
                    ),
                  ),
                  // content
                  Text(
                    content,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: colors?.textWeak,
                    ),
                  ),
                  // button
                  Padding(
                    padding: EdgeInsets.only(left: 20.0.rem(), bottom: 20.0.rem(), right: 20.0.rem()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 16.rem(),
                      children: [
                        // cancel
                        showCancel ? GestureDetector(
                          onTap: () {
                            onCancel?.call();
                            Navigator.of(context).pop(false);
                          },
                          child: Container(
                            height: 46.0.rem(),
                            width: 140.0.rem(),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(6.0.rem()),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              cancelText,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ) : Container(),
                        // confirm
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop(true);
                            onConfirm?.call();
                          },
                          child: Container(
                            height: 46.0.rem(),
                            width: 140.0.rem(),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.0.rem()),
                              gradient: LinearGradient(
                                begin: Alignment(-1.54, 0),
                                end: Alignment(1.54, 0),
                                colors: [
                                  colors?.gradientsPrimaryA ?? Color(0xFF6366F1),
                                  colors?.gradientsPrimaryB ?? Color(0xFFA855F7),
                                ],
                              )
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              confirmText,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: Image.asset(
                'assets/images/bg-dialog-header.webp',
                width: 340.rem(),
                height: 170.rem(),
                fit: BoxFit.fitWidth,
              )
            )
          ]
        )
      ),
    );
  }
}