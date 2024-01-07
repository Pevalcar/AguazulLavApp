import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Formulario extends HookWidget {
  const Formulario({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final keyFrom = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Form(
        key: keyFrom,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClientSearcher(),
            PlacaTextField(),
          ],
        ),
      ),
    );
  }
}

class PlacaTextField extends HookConsumerWidget {
  const PlacaTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placa = ref.watch(placaProvider);
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: placa,
      onChanged: (value) {
        ref.read(placaProvider.notifier).modifyPlaca(value);
      },
      decoration: const InputDecoration(
        labelText: "Placa",
        icon: Icon(Icons.numbers_rounded),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo requerido';
        }
        if (value.length < 6) {
          return 'Placa invalida ';
        }
        return null;
      },
    );
  }
}

class ClientSearcher extends HookConsumerWidget {
  const ClientSearcher({
    super.key,
  });
  static String _displayStringForOption(User option) => option.name;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userOptions = ref.watch(clientListProvider);
    final userSelect = ref.watch(propietarioProvider);

    //TODO add client implementacion
    return Row(
      children: [
        Flexible(
          child: Autocomplete(
            initialValue: TextEditingValue(text: userSelect?.name ?? ''),
            fieldViewBuilder:
                (context, textEditingController, focusNode, onEditingComplete) {
              return TextField(
                autofocus: true,
                controller: textEditingController,
                focusNode: focusNode,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person_search_outlined,
                  ),
                  labelText: 'Search for a client',
                  hintText: 'Search for a client',
                ),
                onSubmitted: (String value) {
                  onEditingComplete();
                },
              );
            },
            displayStringForOption: _displayStringForOption,
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<User>.empty();
              }
              return userOptions.asData!.value.where((User option) {
                return option
                    .toString()
                    .contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (User selection) {
              ref
                  .read(propietarioProvider.notifier)
                  .modifyPropietario(selection);
            },
          ),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          icon: const Icon(Icons.person_add_alt_1),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return _AddClient(
                    onAddClient: (User _user) async {
                      ref.read(clientListProvider.notifier).addUSer(_user,(us) {
                          showToast(context, "Cliente agregado");
                          ref.read(propietarioProvider.notifier).modifyPropietario(us);
                      },);
                    },
                  );
                });
          },
        ),
      ],
    );
  }
}

class _AddClient extends HookWidget {
  final Function(User) onAddClient;
  const _AddClient({required this.onAddClient});

  @override
  Widget build(BuildContext context) {
    //fast adduser dialog
    final _keyForm = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final idController = useTextEditingController();

    final spacer = SizedBox(height: 10);
    return AlertDialog(
      actions: [
        TextButton(
          child: const Text("Cancelar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: const Text("Guardar"),
          onPressed: () {
            _keyForm.currentState!.save();
            if (_keyForm.currentState!.validate()) {
              onAddClient(
                User(
                  name: nameController.text,
                  phone: phoneController.text,
                  identification: idController.text,
                )
              );
            }
            Navigator.of(context).pop();
          }
        )
      ],
      scrollable: true,
      title: const Text("Añadir cliente"),
      content: Form(
        key: _keyForm,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Nombre',
              ),
            ),
            spacer,
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Telefono',
              ),
            ),
            spacer,
            TextFormField(
              controller: idController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Identificacion',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
