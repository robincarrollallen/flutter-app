import 'package:get/get.dart';

class JackpotState {
  final bonusValue = 0.00.obs;

  void setBonusValue(double val) {
    bonusValue.value = val;
  }
}
