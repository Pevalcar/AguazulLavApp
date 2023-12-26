import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TypedCardSelector extends ConsumerWidget {
  const TypedCardSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typesList = ref.watch(typosDeVeiculosProvider);
    final type = ref.watch(typoDeVehiculoProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Tipo de vehiculo:",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Flexible(
          child: DropdownButton(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              dropdownColor: Theme.of(context).secondaryHeaderColor,
              value: type,
              items: typesList
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
              onChanged: (value) {
                ref
                    .read(typoDeVehiculoProvider.notifier)
                    .modifyTypo(value ?? "");
              }),
        ),
      ],
    );
  }
}
