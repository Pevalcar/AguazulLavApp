import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';

class TypeCardSelectable extends HookConsumerWidget {
  const TypeCardSelectable({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listServices = ref.watch(serviceTypeListProvider);
    // final serviceSelection = ref.watch(vehiculoStateProvider).servicios;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listServices.when(
            data: (data) => data?.map((e) => TypeCardService( typeCardService: e, value: false)).toList() ?? [],
        error: (error, stackTrace) => [Text(error.toString())],
        loading: () => [const Center(
          child: CircularProgressIndicator())],
        ),
      ),
    );
  }
}
