import 'package:aguazullavapp/lib.dart';
import 'package:aguazullavapp/shared/theme/flex_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(dartModeProvider);
    final navigatorKey = ref.watch(enrutadorProvider);
    return MaterialApp.router(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        SfGlobalLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('es'),
      ],
      locale: const Locale('es'),
      title: EnvInfo.appName,
      theme: lightTheme,
      darkTheme: darkTheme,
      // theme: MaterialTheme(
      //         GoogleFonts.robotoTextTheme(Theme.of(context).textTheme))
      //     .light(),
      // darkTheme: MaterialTheme(
      //         GoogleFonts.robotoTextTheme(Theme.of(context).textTheme))
      //     .dark(),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: navigatorKey,
    );
  }
}
