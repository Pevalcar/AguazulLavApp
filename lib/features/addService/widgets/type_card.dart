
import 'package:aguazullavapp/lib.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class TypeCardService extends ConsumerWidget {
  final ServiceInfo typeCardService;
  final bool value;

  const TypeCardService({
    super.key,
    required this.typeCardService,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(typeCardService.nameService),
          Checkbox(
            value: value,
            onChanged: (value) {
              
            }
            // onChanged: (value) => ref.read(vehiculoStateProvider.notifier).selectService(typeCardService),
          )
        ],
      ),
      const Icon(Icons.car_crash_sharp, size: 100),
      Text(typeCardService.description),
      Text("\$ ${typeCardService.price}"),
    ]));
  }
}
