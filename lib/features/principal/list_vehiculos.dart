import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/list_process.dart';

class ListVehiculos extends ConsumerWidget {
  const ListVehiculos({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(exapleDataProvider);
    return Scaffold(
      body:  ListProcess(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(firebaseControlProvider.notifier).signOut();
          ref.read(vehiculoStateProvider.notifier).addVehiculo(null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
