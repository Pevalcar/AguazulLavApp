import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'printer_state.g.dart';

@Riverpod(keepAlive: true)
class ConectedBluetue extends _$ConectedBluetue {
  @override
  bool build() {
    return false;
  }

  void setContected(bool contected) {
    state = contected;
  }
}
