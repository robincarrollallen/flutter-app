import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LayoutState {
  final padding = const EdgeInsets.all(0.0).obs;

  void setPadding(EdgeInsets value) {
    padding.value = value;
  }
}