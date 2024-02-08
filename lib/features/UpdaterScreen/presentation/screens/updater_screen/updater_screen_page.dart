import 'package:aguazullavapp/lib.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';
import 'package:upgrader/upgrader.dart';

class UpdaterScreenPage extends HookConsumerWidget {
  const UpdaterScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<double> progressValue = useState(0.0);
    final upgrader = ref.watch(upgraderProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('UpdaterScreenPage'),
          centerTitle: true,
        ),
        body: upgrader.when(
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (upgrader) => UpgradeAlert(
            upgrader: upgrader,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 16.0, right: 16),
                    child: LinearProgressIndicator(
                      value: progressValue.value,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 16.0, right: 16, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            'downloading ${(progressValue.value * 100).toStringAsFixed(0)} %')
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () =>
                          _networkInstallApk(context, progressValue),
                      child: Text('network install apk')),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ));
  }

  _networkInstallApk(context, ValueNotifier<double> _progressValue) async {
    if (_progressValue.value != 0 && _progressValue.value < 1) {
      showToast(context, "Wait a moment, downloading");
      return;
    }
    final appcast = Appcast();
    final items = await appcast.parseAppcastItemsFromUri(
        'https://cast.appcastify.com/geomemsoluciones/aguazullavapp.xml');
    final bestItem = appcast.bestItem();
    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "/AguazulLavApp.apk";
    String fileUrl = bestItem?.fileURL ??
        'https://cast.appcastify.com/geomemsoluciones/aguazullavapp.apk';
    await Dio().download(fileUrl, savePath, onReceiveProgress: (count, total) {
      final value = count / total;
      if (_progressValue.value != value) {
        if (_progressValue.value < 1.0) {
          _progressValue.value = count / total;
        } else {
          _progressValue.value = 0.0;
        }
        print((_progressValue.value * 100).toStringAsFixed(0) + "%");
      }
    });

    final res = await InstallPlugin.install(savePath);
    showToast(context,
        "install apk ${res['isSuccess'] == true ? 'success' : 'fail:${res['errorMessage'] ?? ''}'}");
  }
}
