import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Formulario extends HookConsumerWidget {
  Formulario({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _keyFrom = GlobalKey<FormState>();
    return Form(
      key: _keyFrom,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClientSearcher(),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            initialValue: ref.watch(vehiculoStateProvider).value?.placa,
            onChanged: (value) {
              ref.read(vehiculoStateProvider.notifier).modifyPlaca(value);
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
                return 'Placa invalida';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}

class ClientSearcher extends HookWidget {
  const ClientSearcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //TODO add client implementacion 
    final querry = useState('');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Flexible(
            child: SearchAnchor(
              builder: (context, controller) {
                return SearchBar(
                  controller: controller,
                  onTap: () {
                    controller.openView();
                  },
                  onChanged: (value) {
                    querry.value = value;
                    controller.openView();
                  },
                  hintText: "Buscar propietario",
                  leading: Icon(Icons.person_outline_outlined),
                );
              },
              suggestionsBuilder: (context, controller) {
                return List<ListTile>.generate(5, (int index) {
                  final String item = 'item $index';
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      controller.closeView(item);
                    },
                  );
                });
              },
            ),
          ),
          const SizedBox(width: 8),
          Tooltip(
            message: 'Agregar Cliente',
            child: IconButton(
              icon: Icon(
                Icons.person_search_outlined,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
