import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'info_app_privider.g.dart';

@riverpod
FutureOr<String> InfoApp(InfoAppRef ref) {
  return PackageInfo.fromPlatform().then((value) => value.version);
}
