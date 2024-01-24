import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';

import 'list_jornadas.dart';

//TODO agregar pc soport
class HistoryScreen extends HookWidget {
  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<double> _progressValue = useState(0.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: const [DarkModeButton()],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  _networkInstallApk(context, _progressValue.value);
                  // ListJornadasRoute().push(context);
                },
                child: const Text('Lista de jornadas')),
          ],
        ),
      ),
    );
  }

  _networkInstallApk(context, double _progressValue) async {
    if (_progressValue != 0 && _progressValue < 1) {
      showToast(context, "Wait a moment, downloading");
      return;
    }
    //Divice android is?
    if (!Platform.isAndroid) showToast(context, "Device not supported ");
    String divicesuport;
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    divicesuport = androidInfo.supportedAbis.first;

    var appDocDir = await getTemporaryDirectory();
    String savePath = appDocDir.path + "/AguazulLavApp_${divicesuport}.apk";
    //appsa soportadas son app-armeabi-v7a-release.apk , app-arm64-v8a-release.apk y app-x86_64-release.apk
    String fileUrl =
    "https://github.com/Pevalcar/AguazulLavApp/releases/download/v0.5.0/app-x86_64-release.apk";
    await Dio().download(fileUrl, savePath, onReceiveProgress: (count, total) {
      final value = count / total;
      if (_progressValue != value) {
        if (_progressValue < 1.0) {
          _progressValue = count / total;
        } else {
          _progressValue = 0.0;
        }
        print((_progressValue * 100).toStringAsFixed(0) + "%");
      }
    });

    final res = await InstallPlugin.install(savePath);
    showToast(context,
        "install apk ${res['isSuccess'] == true ? 'success' : 'fail:${res['errorMessage'] ?? ''}'}");
  }
}
