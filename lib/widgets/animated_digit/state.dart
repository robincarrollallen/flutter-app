import 'package:get/get.dart';

class JackpotState {
  final numerical = 0.00.obs;

  void setNumericalValue(double val) {
    numerical.value = val;
  }
}
