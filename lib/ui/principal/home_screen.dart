import 'package:aguazullavapp/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/rute/rutes.dart';
import 'widgets/list_process.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listServices = ref.watch(serviceListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Car wash Aguazul'),
        elevation: 10,
      ),
      body: listServices.when(
        data: (data) => ListProcess(listServices: data),
        error: (error, stackTrace) => const Center(child: Text('Error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, const Rutas.AddService().route);
          ref.read(vehiculoStateProvider.notifier).reset();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
