import 'dart:convert';
import 'dart:io';

import 'package:aguazullavapp/lib.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

//hacer un plugin
class UpdaterAlert extends HookConsumerWidget {
  const UpdaterAlert({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateAppProvider = true;
    final update = updateAppProvider;
    return update
        ? AlertDialog(
            title: const Text("Actualizaciones disponibles"),
            content: const Text(
              "¿Desea actualizar la app?",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                child: const Text("Cancelar"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text("Actualizar"),
                onPressed: () {
                  checUpdate();
                  Navigator.pop(context);
                },
              ),
            ],
          )
        : Container();
  }
}

Future checUpdate() async {
  //read the latest version to json nin rawgit
  const urlJson =
      'https://raw.githubusercontent.com/Pevalcar/AguazulLavApp/develop/versions.json';
  final response = await Dio().get(urlJson);
  if (response.statusCode == 200) {
    final data = JsonDecoder().convert(response.data);
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
        return await FirebaseCrashlytics.instance.recordError(
            "no soportado ${androidInfo.supportedAbis[0]}", StackTrace.current);
      }
      url = version["url"][androidInfo.supportedAbis[0]];
    } else if (Platform.isIOS) {
      //TODO soporte descarga
      version = data["ios"];
      url = version["url"];
    } else if (Platform.isWindows) {
      version = data["windows"];
      url = version["url"];
    }
    if (checkUpdate(currentVersion, version)) {
      logger.i("new version available ${version["latest"]}");
    }
  }
}

bool checkUpdate(String currentVersion, Map<String, dynamic> version) {
  final currentParts = currentVersion.split('.');
  final latestParts = version["latest"]?.split('.');
  if (currentParts[0] != latestParts?[0] ||
      currentParts[1] != latestParts?[1] ||
      currentParts[2] != latestParts?[2]) {
    Logger().i("new version available");
    return true;
  }
  Logger().i("no new version available");
  return false;
}
