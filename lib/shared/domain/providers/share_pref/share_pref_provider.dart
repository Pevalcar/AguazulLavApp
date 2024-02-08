import 'package:aguazullavapp/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'share_pref_provider.g.dart';

@riverpod
SharedPrefsService sharePre(SharePreRef ref) {
  final SharedPrefsService preferences = SharedPrefsService();
  preferences.init();
  return preferences;
}
