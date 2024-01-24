import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:upgrader/upgrader.dart';

class MyApp extends HookConsumerWidget {
  MyApp({super.key});


static const appcastURL =
    'https://raw.githubusercontent.com/Pevalcar/AguazulLavApp/v0.5.0/appcast.xml';
final upgrader = Upgrader(
    appcastConfig:
        AppcastConfiguration(url: appcastURL, supportedOS: ['android']));
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(dartModeProvider);
    final navigatorKey = ref.watch(enrutadorProvider);
    return MaterialApp.router(
      title: 'AguazullavApp',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(),
      ),
      darkTheme:
          ThemeData(useMaterial3: true, colorScheme: const ColorScheme.dark()),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: navigatorKey,
      builder: (context, child) {
        return UpgradeAlert(
          navigatorKey: navigatorKey.routerDelegate.navigatorKey,
          upgrader: upgrader,
          child: child ?? Text("Algo mas"),
        );
      },
    );
  }
}
