import 'package:aguazullavapp/providers/global/firebase_control.dart';
import 'package:aguazullavapp/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
