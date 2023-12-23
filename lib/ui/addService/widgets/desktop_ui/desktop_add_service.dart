import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesktopAddService extends HookConsumerWidget {
  const DesktopAddService();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Información del vehiculo'),
        actions: [const AppBarAddService(mobile: true)],
      ),
      body: const Center(child: Handled()),
    );
  }
}
