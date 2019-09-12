import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_example/sound_wave.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(WelcomeState state, Dispatch dispatch, ViewService viewService) {
  return Container(
    color: Colors.white,
    alignment: Alignment.center,
    child: SoundWave(state.controller, 76, 92)
  );
}