import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TypedCardSelector extends ConsumerWidget {
  const TypedCardSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(vehiculoStateProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text("Tipo de vehiculo:"),
        DropdownButton(
            value: state.type,
            items: VeiculoType.values
                .toList()
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e.name),
                    ))
                .toList(),
            onChanged: (value) {
              // ref.read(vehiculoStateProvider.notifier).modifyType(value);
            }),
      ],
    );
  }
}
