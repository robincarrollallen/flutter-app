import 'package:get/get.dart';
import 'package:flutter/material.dart';

class StatusState {
  final padding = const EdgeInsets.all(0.0).obs;

  void setPadding(EdgeInsets value) {
    padding.value = value;
  }
}