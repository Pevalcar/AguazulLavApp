import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'widgets/list_process.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(exapleDataProvider);
    final listServices = ref.watch(serviceListProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [DarkModeButton()],
        title: Text(data.when(data: (data) => data, error: (error, stackTrace) => 'Error: $error', loading: () => 'Cargando...')),
        elevation: 10,
      ),
      body: listServices.when(
        data: (data) => ListProcess(listServices: data),
        error: (error, stackTrace) =>  Center(child: Text('Error: $error')),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(firebaseControlProvider.notifier).signOut();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
