
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part "ligthmodeprovider.g.dart";

@riverpod
class DartMode extends _$DartMode {
  bool mode = false;
  @override
  ThemeMode build() {
    return ThemeMode.dark;
  }
//TODO : toggle the mode save in local storage
  void toggle() {
    mode = !mode;
    state = mode ? ThemeMode.dark : ThemeMode.light ;
  }
}