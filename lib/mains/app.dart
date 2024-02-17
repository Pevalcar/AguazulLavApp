import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(dartModeProvider);
    final navigatorKey = ref.watch(enrutadorProvider);
    return MaterialApp.router(
      title: EnvInfo.appName,
      theme: MaterialTheme(GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)).light(),
      darkTheme: MaterialTheme(GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)).dark(),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: navigatorKey,
    );
  }
}
