
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "ligthmodeprovider.g.dart";

@riverpod
class DartMode extends _$DartMode {
  bool mode = true;
  @override
  ThemeMode build() {
    return ThemeMode.system;
  }
//TODO : toggle the mode save in local storage
  void toggle() {
    mode = !mode;
    state = mode ? ThemeMode.dark : ThemeMode.light ;
  }
}