import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class WelcomeState implements Cloneable<WelcomeState> {

  bool loading;
  AnimationController controller;

  @override
  WelcomeState clone() {
    return WelcomeState()
      ..loading = loading
      ..controller = controller;
  }
}

WelcomeState initState(Map<String, dynamic> args) {
  return WelcomeState()
    ..loading = true;
}
