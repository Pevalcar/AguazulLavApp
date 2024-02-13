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

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Panel principal'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    const UpgraderRoute().push(context);
                  },
                  //TODO agregar bagde de actualizaciones
                  icon: Icon(Icons.update)) ,
              const DarkModeButton(),
              const SizedBox(width: 16),
              const AvatarIcon(),
              const SizedBox(width: 16),
            ],
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 600) {
              return const MainMenuDesktop();
            }
            return const MainMenuMobile();
          }),
        ),
      ),
    );
  }
}

class AvatarIcon extends HookConsumerWidget {
  const AvatarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        ref.read(userStateCurrentProvider.notifier).signOut();
        //TODO agregar cicle avatar
      },
      child: const CircleAvatar(
        child: Icon(Icons.person),
      ),
    );
  }
}

class MainMenuMobile extends StatelessWidget {
  const MainMenuMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(
          child: MenuGridConten(),
        ),
        InfoCount(),
      ],
    );
  }
}

class MainMenuDesktop extends StatelessWidget {
  const MainMenuDesktop({super.key});
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InfoCount(),
        Expanded(
          child: MenuGridConten(),
        ),
      ],
    );
  }
}

Future<bool> _checUpdate() async {
  //read the latest version to json nin rawgit
  const urlJson =
      'https://raw.githubusercontent.com/Pevalcar/AguazulLavApp/develop/versions.json';
  final response = await Dio().get(urlJson);
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
    if (_checkUpdate(currentVersion, version)) {
      logger.i("new version available ${url}");
      return true;
    } else {
      logger.i("no new version available");
      return false;
    }
  }
  return false;
}

bool _checkUpdate(String currentVersion, Map<String, dynamic> version) {
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
