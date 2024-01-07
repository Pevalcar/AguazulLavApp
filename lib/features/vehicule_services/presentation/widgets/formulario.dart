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
    final userOptions = ref.watch(listPropietariosProvider);

    //TODO add client implementacion
    return Row(
      children: [
        Flexible(
          child: Autocomplete(
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
              return userOptions.where((User option) {
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
            
            //! TODO add client ventan emergente con informacion requerida
            ref.read(listPropietariosProvider.notifier).addPropietario();
          },
        ),
      ],
    );
  }
}
