import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarAddService extends HookConsumerWidget {
  const AppBarAddService({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiculo = ref.watch(vehiculoStateProvider);
    ref.listen(vehiculoStateProvider, (previous, next) { 
      if (next.error != null) {
        _sendMessage(context, next.error);
      } 
    }) ;
    return Row(
      children: [
        const DarkModeButton(),
        vehiculo.when(
          data: (data) => IconButton(
              icon: const Icon(Icons.add),
              onPressed: data.terminado
                  ? null
                  : () {
                    //TODO add service
                      // ref.read(vehiculoStateProvider.notifier).addService();
                    }),
          error: (error, stackTrace) {
            debugPrint('error: ${error}');
            return const Icon(Icons.error);
          },
          loading: () => const CircularProgressIndicator(),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }

  _sendMessage(BuildContext context, Object? error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error.toString()),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }
}
