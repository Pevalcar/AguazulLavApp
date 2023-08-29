import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../model/models.dart';
import '../../../providers/index.dart';

class TypedCardSelector extends ConsumerWidget {
  const TypedCardSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehicular = ref.watch(vehiculoStateProvider);
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
              ref.read(vehiculoStateProvider.notifier).ModifyType(value);
            }),
      ],
    );
  }
}
