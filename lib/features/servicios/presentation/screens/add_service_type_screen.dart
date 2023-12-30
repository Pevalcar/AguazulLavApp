import 'package:hooks_riverpod/hooks_riverpod.dart';
import "package:flutter/material.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";


class AddServiceTypeScreen extends HookConsumerWidget {
  const AddServiceTypeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _keyForm = GlobalKey<FormState>();
    return Form(
      key: _keyForm,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Servicio"),
            const SizedBox(height: 10),
            
          ]
        )
      ),
    );
  }
}