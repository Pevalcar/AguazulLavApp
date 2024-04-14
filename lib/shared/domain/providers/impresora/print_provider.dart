import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'print_provider.g.dart';

@riverpod
class OptionPrintType extends _$OptionPrintType {
  @override
  PaperSize build() {
    return PaperSize.mm80;
  }

  void update(PaperSize paperSize) {
    state = paperSize;
  }
}
