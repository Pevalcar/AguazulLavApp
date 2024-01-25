import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JornadaCard extends StatelessWidget {
  const JornadaCard({
    super.key,
    required Jornada jornadad,
  }) : _jornadad = jornadad;
  final Jornada _jornadad;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final dateFormatHours = DateFormat('dd/MM/yyyy-hh:mm');
    final time = dateFormat.format(_jornadad.dateInit ?? DateTime.now());
    return ListTile(
      onTap: () {
        JornadaInfoRoute($extra: _jornadad).push(context);
      },
      title: Text(" Jornada $time"),
      tileColor: Colors.blueGrey[100],
      leading: _jornadad.enJornada
          ? Icon(Icons.directions_walk,
              color: Theme.of(context).colorScheme.error)
          : const Icon(
              Icons.check,
              color: Colors.greenAccent,
            ),
      subtitle: Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                "Inicio : ${dateFormatHours.format(_jornadad.dateInit ?? DateTime.now())}"),
            Visibility(
              visible: !_jornadad.enJornada,
              child: Text(
                  "Final ${dateFormatHours.format(_jornadad.dateEnd ?? DateTime(11))}"),
            )
          ],
        ),
      ),
    );
  }
}
