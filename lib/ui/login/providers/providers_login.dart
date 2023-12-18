import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers_login.g.dart';

@riverpod
class ShowPass extends _$ShowPass {
  @override
  bool build() {
    return true;
  }

  void toggle() {
    state = !state;
  }
}

enum screensMode { login, register, forgot }

@riverpod
class ScreensMode extends _$ScreensMode {
  @override
  screensMode build() {
    return screensMode.login;
  }

  void toggle(screensMode mode) {
    state = mode;
  }
}
