// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:aguazullavapp/lib.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpdaterAlert extends HookConsumerWidget {
  final Widget? child;
  final Function() onUpdate;
  final Function() onLater;

  const UpdaterAlert(
      {super.key,
      required this.child,
      required this.onUpdate,
      required this.onLater});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<Object>(
        future: checUpdate(),
        builder: (context, snapshot) {
          showUpdateAlert(context, check: snapshot.data != null);
          return child ?? const SizedBox();
        });
  }

  showUpdateAlert(BuildContext context, {required bool check}) async {
    if (check) {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Actualizaciones disponibles"),
          content: const Text(
            "¿Desea actualizar la app?",
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text("Actualizar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
    ;
  }
}

Future<bool> checUpdate() async {
  //read the latest version to json nin rawgit
  final response = await Dio().get(URLVERSIONS);
  if (response.statusCode == 200) {
    final data = JsonDecoder().convert(response.data);
    Map<String, dynamic> version = {};
    final String currentVersion =
        await PackageInfo.fromPlatform().then((value) => value.version);
    //check os
    final deviceInfo = DeviceInfoPlugin();
    if (kIsWeb) {
      version = data["android"];
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      version = data["android"];
    } else if (Platform.isIOS) {
      //TODO soporte descarga
      version = data["ios"];
    } else if (Platform.isWindows) {
      version = data["windows"];
    }
    if (checkUpdate(currentVersion, version)) {
      logger.i("new version available ");
      return true;
    } else {
      logger.i("no new version available");
      return false;
    }
  }
  return false;
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
