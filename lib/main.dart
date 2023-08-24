import 'package:aguazullavapp/constants/rute/rutes.dart';
import 'package:aguazullavapp/ui/addService/add_service_screen.dart';
import 'package:aguazullavapp/ui/principal/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(useMaterial3: true, colorScheme: const ColorScheme.light()),
      darkTheme:
          ThemeData(useMaterial3: true, colorScheme: const ColorScheme.dark()),
      themeMode: ThemeMode.light,
      initialRoute: const Rutas.Principal().route,
      routes: {
        const Rutas.Principal().route: (context) => const HomePage(),
        const Rutas.AddService().route: (context) => const AddServiceScreen(),
      },
    );
  }
}
