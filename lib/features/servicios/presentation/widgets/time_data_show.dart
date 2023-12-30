import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//TODO REVISAR Diseño
class TimerDataShow extends ConsumerWidget {
  const TimerDataShow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initTime = ref.watch(vehiculoStateProvider).asData?.value.entrada;
    final endTime = ref.watch(vehiculoStateProvider) .asData?.value.salida;
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _TextDateTime(
            text: "Entrada: ",
            time: initTime == null ? DateTime.now() : initTime,
          ),
          _TextDateTime(text: "Salida: ", time: endTime),
        ],
      ),
    );
  }
}

class _TextDateTime extends StatelessWidget {
  final DateTime? time;
  final String text;

  const _TextDateTime({
    super.key,
    required this.time,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text.rich(
        
        TextSpan(
          text: text,
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: _format(time),
              style: const TextStyle(fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }

  String _format(DateTime? time) {
    if (time == null) {
      return "Sin Definir";
    }
    return "${time.year}/${time.month}/${time.day} # ${time.hour}:${time.minute}:${time.second}";
  }
}
