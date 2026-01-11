import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PinAccesDialog extends HookConsumerWidget {
  const PinAccesDialog({
    super.key,
    required this.correctPass,
  });

  final Function()? correctPass;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinAsync = ref.watch(pinPassProvider);
    final int? pin = pinAsync.asData?.value; // null while loading or on error
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
            onPressed: (pin == null)
                ? null
                : () {
                    form.currentState!.save();
                    if (!form.currentState!.validate()) return;
                    final entered = int.tryParse(passController.text);
                    if (entered != null && entered == pin) {
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
              // Estado del PIN
              if (pinAsync.isLoading)
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: LinearProgressIndicator(),
                ),
              if (pinAsync.hasError)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'No se pudo cargar el PIN',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.error),
                  ),
                ),
              Form(
                key: form,
                child: TextFormField(
                  controller: passController,
                  autofocus: true,
                  decoration: const InputDecoration(labelText: 'Pin'),
                  textInputAction: TextInputAction.done,
                  obscuringCharacter: '*',
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onFieldSubmitted: (String value) {
                    form.currentState!.save();
                    if (pin == null) return; // aún no disponible
                    if (!form.currentState!.validate()) return;
                    final entered = int.tryParse(value);
                    if (entered != null && entered == pin) {
                      if (correctPass != null) {
                        correctPass!();
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo requerido';
                    }
                    if (pin == null) {
                      return 'PIN no disponible, intente de nuevo';
                    }
                    final entered = int.tryParse(value);
                    if (entered == null) return 'Solo números';
                    if (entered != pin) return 'Pin incorrecto';
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
