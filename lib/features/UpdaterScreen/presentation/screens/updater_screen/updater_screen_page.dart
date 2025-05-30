import 'dart:convert';
import 'dart:io';

import 'package:aguazullavapp/lib.dart';
// ignore: depend_on_referenced_packages
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:install_plugin/install_plugin.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

class UpdaterScreenPage extends HookConsumerWidget {
  const UpdaterScreenPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<double> progressValue = useState(0.0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar actualizaciones'),
        centerTitle: true,
        actions: const [DarkModeButton()],
      ),
      body: FutureBuilder(
          future: checUpdate(),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            String? url = snapshot.data;
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      url == null
                          ? "Tu app ya es la ultima version"
                          : "Nueva version disponible",
                      style: Theme.of(context).textTheme.titleLarge),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 16.0, right: 16),
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10),
                      minHeight: 10,
                      color: Theme.of(context).colorScheme.primary,
                      value: progressValue.value,
                      backgroundColor: Colors.grey,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 16.0, right: 16, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            ' ${(progressValue.value * 100).toStringAsFixed(0)} %')
                      ],
                    ),
                  ),
                  Visibility(
                    visible: progressValue.value == 0.0 && url != null,
                    child: ElevatedButton(
                        onPressed: () => _networkInstallApk(
                              context,
                              progressValue,
                              url ?? "",
                            ),
                        child: Text(
                          ('Instalar Actualizacion'.toUpperCase()),
                        )),
                  ),
                  Visibility(
                    visible: progressValue.value != 0.0,
                    child: const Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10),
                        Text("Descargando...")
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          }),
    );
  }

  _networkInstallApk(
      context, ValueNotifier<double> progressValue, String url) async {
    if (progressValue.value != 0 && progressValue.value < 1) {
      showToast(context, "Wait a moment, downloading");
      return;
    }
    var appDocDir = await getTemporaryDirectory();
    String savePath = "${appDocDir.path}/AguazulLavApp.apk";
    // String fileUrl = bestItem?.fileURL ??
    await Dio().download(url, savePath, onReceiveProgress: (count, total) {
      final value = count / total;
      if (progressValue.value != value) {
        if (progressValue.value < 1.0) {
          progressValue.value = count / total;
        } else {
          progressValue.value = 0.0;
        }
        if (kDebugMode) {
          print("${(progressValue.value * 100).toStringAsFixed(0)}%");
        }
      }
    });

    // TODO: Implement APK installation for update (was using install_plugin)
    // final res = await InstallPlugin.install(savePath);
    // if (res['isSuccess'] == true) {
    //   showToast(context, "install apk success");
    //   progressValue.value = 0.0;
    // } else {
    //   showErrorToast(context, "install apk fail:{res['errorMessage'] ?? ''}");
    //   progressValue.value = 0.0;
    // }
    // logger.i(res);
  }

  Future<String?> checUpdate() async {
    //read the latest version to json nin rawgit
    final response = await Dio().get(URLVERSIONS);
    if (response.statusCode == 200) {
      final data = const JsonDecoder().convert(response.data);
      Map<String, dynamic> version = {};
      final String currentVersion =
          await PackageInfo.fromPlatform().then((value) => value.version);
      //check os
      final deviceInfo = DeviceInfoPlugin();
      String url = "";
      if (kIsWeb) {
        version = data["android"];
      } else if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        version = data["android"];
        if (![
          "x86_64",
          "arm64-v8a",
          "armeabi-v7a",
        ].contains(androidInfo.supportedAbis[0])) {
          logger.i("no soportado ${androidInfo.supportedAbis[0]}");
          await FirebaseCrashlytics.instance.recordError(
              "no soportado ${androidInfo.supportedAbis[0]}",
              StackTrace.current);
        }
        url = version["url"]["stable"];
      } else if (Platform.isIOS) {
        //TODO soporte descarga
        version = data["ios"];
        url = version["url"];
      } else if (Platform.isWindows) {
        version = data["windows"];
        url = version["url"];
      }
      if (checkUpdate(currentVersion, version)) {
        logger.i("new version available $url");
        return url;
      } else {
        logger.i("no new version available");
        return null;
      }
    } else {
      logger.i("no new version json available");
    }
    return null;
  }

  bool checkUpdate(String currentVersion, Map<String, dynamic> version) {
    final currentParts = currentVersion.split('.');
    final latestParts = version["latest"]?.split('.');
    if (currentParts[0] != latestParts?[0] ||
        currentParts[1] != latestParts?[1] ||
        currentParts[2] != latestParts?[2]) {
      return true;
    }
    return false;
  }
}
