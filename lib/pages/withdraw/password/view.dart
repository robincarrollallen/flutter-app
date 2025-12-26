import 'package:flutter/material.dart';
import '/components/passwordInput.dart';
import '/components/ripple_button.dart';
import '/theme/variables/custom.dart';
import '/utils/screen.dart';

class PayPasswordPage extends StatelessWidget {
  const PayPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomColors>(); // 主题颜色<扩展>

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Withdraw Password', style: TextStyle(fontSize: 14.0.rem(), fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.rem()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Set Withdraw Password', style: TextStyle(fontSize: 12.0.rem(), fontWeight: FontWeight.w600, color: colors?.textDefault)),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 16.0.rem(), bottom: 8.0.rem()),
              child: Text('New Withdraw Password', style: TextStyle(fontSize: 12.0.rem(), color: colors?.iconWeaker))
            ),
            PasswordInput(
              autofocus: true,
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 16.0.rem(), bottom: 8.0.rem()),
              child: Text('Confirm Withdraw Password', style: TextStyle(fontSize: 12.0.rem(), color: colors?.iconWeaker))
            ),
            PasswordInput(),
            Padding(
              padding: EdgeInsetsGeometry.only(top: 16.0.rem(), bottom: 28.0.rem()),
              child: Text('The first withdrawal, you need to set the withdrawal password first', style: TextStyle(fontSize: 10.0.rem(), color: colors?.textWarning))
            ),
            RippleButton(
              gradient: LinearGradient(
                colors: [
                  colors?.gradientsPrimaryA ?? Colors.blue,
                  colors?.gradientsPrimaryB ?? Colors.lightBlue,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              child: Text('Withdraw Now', style: TextStyle(fontSize: 14.0.rem(), fontWeight: FontWeight.bold, color: colors?.textDefault))
            )
          ],
        ),
      )
    );
  }
}
