import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import  'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

final formatter =
    NumberFormat.simpleCurrency(locale: "es_MX", decimalDigits: 0);

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }
    double value = double.parse(newValue.text);

    String newText = formatter.format(value);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}

String formatearIntACantidad(int value) {
  return formatter.format(value);
}

int correctionPrice(String? value) {
  if (value == null) {
    return 0;
  }
  return int.parse(value
      .replaceAll('.00', '')
      .replaceAll(',', '')
      .replaceAll('\$', '')
      .trim());
}

class SliverTitleDelegate extends SliverPersistentHeaderDelegate {
  double toolBarHeight;
  //toolBarHeight Included in both
  double alturaCerrado;
  double alturaAbierto;
  Color? color;
  SliverTitleDelegate({
    required this.child,
    this.toolBarHeight = 0.0,
    this.alturaCerrado = 0.0,
    this.alturaAbierto = 0.0,
    this.color ,
  });

  Widget child;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: (toolBarHeight) + (alturaAbierto),
      color:  color ?? Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FittedBox(
              fit: BoxFit.contain,
              child: child,
            )),
      ),
    );
  }
  @override
  // TODO: implement maxExtent
  double get maxExtent => toolBarHeight + alturaAbierto;

  @override
  // TODO: implement minExtent
  double get minExtent => toolBarHeight + alturaCerrado;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
