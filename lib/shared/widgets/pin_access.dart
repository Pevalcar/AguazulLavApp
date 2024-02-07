import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PinAccesDialog extends HookConsumerWidget {
  const PinAccesDialog({
    super.key,
    required this.correctPass,
  });

  final Function()? correctPass;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _pin = ref.watch(pinPassProvider).asData?.value ?? 0;
    final passController = TextEditingController();
    final form = GlobalKey<FormState>();
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar')),
        TextButton(
            onPressed: () {
              form.currentState!.save();
              if (form.currentState!.validate() &&
                  int.parse(passController.text) == _pin) {
                if (correctPass != null) {
                  correctPass!();
                }
                Navigator.of(context).pop();
              }
            },
            child: const Text('Aceptar')),
      ],
      title: const Text(
        'Ingrese un pin',
        style: TextStyle(fontSize: 20),
      ),
      content: Wrap(
        children: [
          Column(
            children: [
              const SizedBox(height: 20),
              Form(
                key: form,
                child: TextFormField(
                  controller: passController,
                  autofocus: true,
                  decoration: const InputDecoration(labelText: 'Pin'),
                  textInputAction: TextInputAction.done,
                  obscuringCharacter: '*',
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (String value) {
                    form.currentState!.save();
                    if (form.currentState!.validate() &&
                        int.parse(value) == _pin) {
                      if (correctPass != null) {
                        correctPass!();
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo requerido';
                    } else if (int.parse(value) != _pin) {
                      return 'Pin incorrecto';
                    }

                    return null;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
