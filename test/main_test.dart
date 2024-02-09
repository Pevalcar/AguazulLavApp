import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  testWidgets('test main', (tester) async {
    await tester.pumpWidget(Container());
  });
}