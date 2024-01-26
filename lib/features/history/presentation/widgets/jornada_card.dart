import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistorialJornadaCard extends StatelessWidget {
  const HistorialJornadaCard({
    super.key,
    required Jornada jornadad,
  }) : _jornadad = jornadad;
  final Jornada _jornadad;

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat('dd/MM/yyyy');
    final dateFormatHours = DateFormat('dd/MM/yyyy-hh:mm');
    final time = dateFormat.format(_jornadad.dateInit ?? DateTime.now());
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          tileColor:
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(.30),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              )),
          onTap: () {
            JornadaInfoRoute($extra: _jornadad).push(context);
          },
          title: Text(" Jornada $time",
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          leading: _jornadad.enJornada
              ? Icon(Icons.directions_walk,
                  color: Theme.of(context).colorScheme.error)
              : const Icon(
                  Icons.check,
                  color: Colors.greenAccent,
                ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                    "Inicio : ${dateFormatHours.format(_jornadad.dateInit ?? DateTime.now())}",
                    style: Theme.of(context).textTheme.bodySmall),
              ),
              Visibility(
                visible: !_jornadad.enJornada,
                child: Flexible(
                  child: Text(
                      "Final ${dateFormatHours.format(_jornadad.dateEnd ?? DateTime(11))}",
                      style: Theme.of(context).textTheme.bodySmall),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
