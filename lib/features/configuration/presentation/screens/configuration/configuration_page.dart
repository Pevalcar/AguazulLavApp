import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        title: const Text('Configuracion'),
        centerTitle: true,
        actions: const [DarkModeButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) => PinAccesDialog(
                              correctPass: () =>
                                  const ConfigPinPassRoute().push(context),
                            ));
                  },
                  child: const Text('Configurar Pin')),
              const SizedBox(height: 25),
              const Text('Configuracion de Comiciones'),
              const SizedBox(height: 25),
              const ComicionTextFiel()
            ],
          ),
        ),
      ),
    );
  }
}

class ComicionTextFiel extends HookConsumerWidget {
  const ComicionTextFiel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    controller.text =
        ref.watch(comicionProvider).asData?.value.toString() ?? "";

    return TextField(
      controller: controller,
      onSubmitted: (value) {
        ref.read(comicionProvider.notifier).setComicion(int.parse(value));
      },
      keyboardType: TextInputType.number,
      maxLength: 2,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Configuracion de Comiciones',
          suffix: Text("%")),
    );
  }
}
