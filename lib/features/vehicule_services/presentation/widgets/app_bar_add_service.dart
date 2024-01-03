import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarAddService extends HookConsumerWidget {
  final bool mobile;
  const AppBarAddService({
    super.key,
    required this.mobile,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiculo = ref.watch(vehiculoStateProvider);
    return Row(
      children: [
        const DarkModeButton(),
        mobile ? const SizedBox() :IconButton(
              icon: const Icon(Icons.add),
              onPressed: vehiculo.asData!.value?.terminado ?? false
                  ? null
                  : () {
                      //TODO add service
                      // ref.read(vehiculoStateProvider.notifier).addService();
                    }),
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
        label: 'Ok',
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ));
  }
}
