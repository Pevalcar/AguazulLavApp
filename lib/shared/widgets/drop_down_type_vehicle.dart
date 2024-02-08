import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropDownTypeVehicle extends ConsumerWidget {
  final List<String> typesList;
  final String type;
  final String _title;
  const DropDownTypeVehicle(
      {required this.typesList, required this.type,
        String title = "Tipo de vehiculo:",
       super.key,}) : _title = title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Text(
            _title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
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
