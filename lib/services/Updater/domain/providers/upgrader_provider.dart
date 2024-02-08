import 'package:aguazullavapp/lib.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:upgrader/upgrader.dart';

part 'upgrader_provider.g.dart';

@riverpod
Future<Upgrader> upgrader(UpgraderRef ref) async {
  await Upgrader.clearSavedSettings();
  final upgrader = Upgrader(
    messages: UpgraderMessages(code: "es"),
    appcastConfig:
        AppcastConfiguration(url: APPCASTURL, supportedOS: ['android']),
  );
  return upgrader;
}
