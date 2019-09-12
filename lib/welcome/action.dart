import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum WelcomeAction { action }

class WelcomeActionCreator {
  static Action onAction() {
    return const Action(WelcomeAction.action);
  }
}
