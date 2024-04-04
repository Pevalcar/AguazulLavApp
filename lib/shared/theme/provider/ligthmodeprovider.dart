import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "ligthmodeprovider.g.dart";

@riverpod
class DartMode extends _$DartMode {
  bool _mode = false;
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }

  void toggle() {
    _mode = !_mode;
    state = _mode ? ThemeMode.dark : ThemeMode.light;
  }
}
