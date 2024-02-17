import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PinPassConfigPage extends HookConsumerWidget {
  const PinPassConfigPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinState = ref.watch(pinPassProvider);
    final showpass = useState(false);
    final passControoler = useTextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurar Pin'),
        centerTitle: true,
        actions: const [DarkModeButton()],
      ),
      body: Center(
        child: Column(
          children: [
            IconButton(
              icon: Icon(
                  showpass.value ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                showpass.value = !showpass.value;
              },
            ),
            pinState.when(
                data: (data) => Visibility(
                      replacement: Text(
                        'Pin Actual: ****',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      visible: showpass.value,
                      child: Text(
                        'Pin Actual: ${data.toString()}',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const Skeletonizer(child: Text('loading'))),
            Text(
              'Editar Pin',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passControoler,
                obscureText: !showpass.value,
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  labelText: 'Pin',
                  hintText: 'Escribe el Pin',
                ),
                keyboardType: TextInputType.number,
                maxLength: 4,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            TextButton(
                onPressed: () {
                  ref
                      .read(pinPassProvider.notifier)
                      .setPin(int.parse(passControoler.text));
                },
                child: const Text('Guardar'))
          ],
        ),
      ),
    );
  }
}
