import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ConfigurationPage'),
        centerTitle: true,
        actions: const [DarkModeButton()],
      ),
      body: Center(
        child: Column(
          children: [
            const Text('ConfigurationPage'),
            ElevatedButton(
                onPressed: () => const ConfigPinPassRoute().push(context),
                child: const Text('Configurar Pin')),
          ],
        ),
      ),
    );
  }
}
