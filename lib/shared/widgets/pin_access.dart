import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

class PinAccess extends HookConsumerWidget {
  const PinAccess({required Widget child,
      super.key, this.correctPass, required int correctPin})
      : _child = child,
        _pin = correctPin;

  final Widget _child;
  final Function()? correctPass;
  final int _pin;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passController = TextEditingController();
    final form = GlobalKey<FormState>();
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
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
          ),
        );
      },
      child: Wrap(
        children: [
          Center(
            child: _child,
          ),
        ],
      ),
    );
  }
}
