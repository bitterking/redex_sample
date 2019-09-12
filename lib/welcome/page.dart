import 'package:fish_redux/fish_redux.dart';

import 'package:flutter/material.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WelcomePage extends Page<WelcomeState, Map<String, dynamic>> with TickerProviderMixin {
  WelcomePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<WelcomeState>(
                adapter: null,
                slots: <String, Dependent<WelcomeState>>{
                }),
            middleware: <Middleware<WelcomeState>>[
            ],);

}

mixin TickerProviderMixin<T> on Component<T> {
  @override
  _TickerProviderStfState<T> createState() =>
      _TickerProviderStfState<T>();
}

class _TickerProviderStfState<T> extends ComponentState<T>
    with TickerProviderStateMixin {}
