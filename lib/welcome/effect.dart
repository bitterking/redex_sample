import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';

Effect<WelcomeState> buildEffect() {
  return combineEffects(<Object, Effect<WelcomeState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
  });
}

void _initState(Action action, Context<WelcomeState> ctx) {
  final Object tickerProvider = ctx.stfState;
  ctx.state.controller = AnimationController(
      duration: Duration(milliseconds: 1000), vsync: tickerProvider)..repeat();
  Future.delayed(Duration(milliseconds: 2000), () async {
    Navigator.of(ctx.context).pushAndRemoveUntil(PageRouteBuilder(pageBuilder: (context, _, __) {
      return Container(
        color: Colors.red,
      );
    }), (route) => route == null);
  });
}

void _dispose(Action action, Context<WelcomeState> ctx) {
  ctx.state.controller.dispose();
}
