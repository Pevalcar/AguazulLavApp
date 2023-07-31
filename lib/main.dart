import 'package:aguazullavapp/constants/rutes.dart';
import 'package:aguazullavapp/ui/addService/add_service_screen.dart';
import 'package:aguazullavapp/ui/principal/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
      initialRoute: Rutas.Principal.name,
      routes: {
        Rutas.Principal.name: (context) => const HomePage(),
        Rutas.AddService.name: (context) =>  const AddServiceScreen(),
      },

    );
  }
}
