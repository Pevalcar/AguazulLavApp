import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpdaterAlert extends HookConsumerWidget {
  const UpdaterAlert({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final updateAppProvider = true;
    final update = updateAppProvider;
    return update
        ? AlertDialog(
            title: const Text("Actualizaciones disponibles"),
            content: const Text(
              "¿Desea actualizar la app?",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                child: const Text("Cancelar"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: const Text("Actualizar"),
                onPressed: () {
                  checUpdate();
                  Navigator.pop(context);
                },
              ),
            ],
          )
        : Container();
  }

  Future checUpdate() async {
    //read the latest version to json nin rawgit
    final url = 'https://raw.githubusercontent.com/aguazullavapp/aguazullavapp/main/version.json';
  }
}
