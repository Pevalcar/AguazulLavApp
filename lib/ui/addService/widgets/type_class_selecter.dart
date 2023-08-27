import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/models.dart';
import '../../../providers/index.dart';

class TyperCardSelecter extends ConsumerWidget {
  const TyperCardSelecter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicular = ref.watch(vehiculoProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text("Tipo de vehiculo:"),
        DropdownButton(
            value: vehicular.type,
            items: VeiculoType.values
                .toList()
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ))
                .toList(),
            onChanged: (value) {
              print(value);
              ref.read(vehiculoProvider.notifier).ModifiType(value);
            }),
      ],
    );
  }
}
