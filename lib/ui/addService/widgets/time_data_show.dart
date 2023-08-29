import 'package:aguazullavapp/providers/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimerDataShow extends ConsumerWidget {
  final String initTime;
  final String endTime;
  const TimerDataShow(
      {super.key, required this.initTime, required this.endTime});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String currentTime = ref.watch(currentTimeProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("Entrada: "),
          Text(
            initTime.isEmpty ? currentTime.toString() : initTime,
          ),
          const Text("Salida: "),
          Text(
            endTime.isEmpty ? "No definido" : endTime,
          )
        ],
      ),
    );
  }
}
