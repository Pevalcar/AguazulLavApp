import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

//TODO agregar pc soport
class HistoryScreen extends HookConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: const [DarkModeButton(), RefresButton()],
      ),
      body: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ElevatedButton(
            //     onPressed: () {
            //       const ListJornadasRoute().push(context);
            //     },
            //     child: const Text('Lista de jornadas')),
            CalendarJornada()
          ],
        ),
      ),
    );
  }
}

class RefresButton extends HookConsumerWidget {
  const RefresButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
        onPressed: () {
          // ignore: unused_result
          ref.refresh(jornadasListProvider.future);
        },
        icon: const Icon(Icons.refresh));
  }
}

class CalendarJornada extends HookConsumerWidget {
  const CalendarJornada({
    super.key,
  });
  Jornada _getJornadaByID(List<Jornada>? jornadas, String id) {
    return jornadas!.firstWhere((element) => element.id == id);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jornadas = ref.watch(jornadasListProvider);
    final showAgenda = useState(false);

    return jornadas.when(
      data: (data) => Expanded(
        child: SfCalendar(
          onTap: (_data) {
            if (_data.appointments == null) return;
            if (_data.appointments!.isEmpty) {
              showAgenda.value = false;
              return;
            }
            showAgenda.value = true;
            Jornada jornada;
            if (_data.targetElement == CalendarElement.appointment) {
              jornada = _getJornadaByID(data, _data.appointments!.first.id);
              JornadaInfoRoute($extra: jornada).push(context);
            }
          },
          view: CalendarView.month,
          dataSource: _getCalendarDataSource(data),
          monthViewSettings: MonthViewSettings(
            showAgenda: showAgenda.value,
            agendaItemHeight: 50,
          ),
        ),
      ),
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Expanded(
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

_AppointmentDataSource _getCalendarDataSource(List<Jornada>? jornadas) {
  List<Appointment> appointments = <Appointment>[];
  if (jornadas == null) return _AppointmentDataSource(appointments);

  for (var jornada in jornadas) {
    appointments.add(Appointment(
      startTime: jornada.dateInit ?? DateTime.now(),
      endTime:
          jornada.dateEnd ?? DateTime.now().add(const Duration(minutes: 10)),
      subject:
          "Jornada ${DateFormat('dd/MM/yyyy').format(jornada.dateInit ?? DateTime.now())}",
      color: jornada.enJornada ? Colors.green : Colors.blue,
      startTimeZone: '',
      endTimeZone: '',
      id: jornada.id,
    ));
  }
  return _AppointmentDataSource(appointments);
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
