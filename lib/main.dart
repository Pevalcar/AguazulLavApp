import 'package:aguazullavapp/providers/global/ligthmodeprovider.dart';
import 'package:aguazullavapp/providers/index.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';

void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(dartModeProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      
      theme:
          ThemeData(useMaterial3: true, colorScheme: const ColorScheme.light()),
      darkTheme:
          ThemeData(useMaterial3: true, colorScheme: const ColorScheme.dark()),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(enrutadorProvider),
    );
  }
}
