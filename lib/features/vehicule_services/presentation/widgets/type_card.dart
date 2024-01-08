import 'package:aguazullavapp/lib.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ServiceTypeCard extends ConsumerWidget {
  final ServiceType typeCardService;
  final bool value;

  const ServiceTypeCard({
    super.key,
    required this.typeCardService,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        shadowColor: value ? Colors.blue : null,
        color: value ? Colors.blue : null,
        elevation: 4,
        child: InkWell(
          onTap: () => ref
              .read(serviceTypeSelectProvider.notifier)
              .modifyServiceType(typeCardService),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Text(
                        typeCardService.clase,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    //TODO! cambiar apariencia de el check
                    Checkbox(
                      value: value,
                      onChanged: (value) => ref
                          .read(serviceTypeSelectProvider.notifier)
                          .modifyServiceType(typeCardService),
                    )
                  ],
                ),
                // const Icon(Icons.car_crash_sharp, size: 100),
                Text(
                  typeCardService.description,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(typeCardService.price),
              ],
            ),
          ),
        ));
  }
}
