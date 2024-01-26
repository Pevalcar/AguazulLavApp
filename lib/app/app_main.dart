import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

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
    );
  }
}
