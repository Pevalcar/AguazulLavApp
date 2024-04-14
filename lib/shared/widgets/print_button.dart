import 'package:aguazullavapp/lib.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class PrintButton extends HookConsumerWidget {
  const PrintButton({
    super.key,
    required this.client,
    required this.vehicle,
  });

  final AsyncValue<Client?> client;
  final Vehicle vehicle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PaperSize sizePaper = ref.watch(optionPrintTypeProvider);
    final ConfiguracionModel? configuracion =
        ref.watch(configuracionesProvider).asData?.value;
    final bool connect = ref.watch(conectedBluetueProvider);
    return MyActionButton(
      editable: connect,
      icon: Icons.print,
      text: "Imprimir tiket",
      onPressed: () async {
        await printTest(
            client: client.asData?.value,
            vehicle: vehicle,
            configuracion: configuracion,
            conexionStatus: connect,
            size: sizePaper);
      },
    );
  }
}

Future<void> printTest(
    {Vehicle? vehicle,
    Client? client,
    ConfiguracionModel? configuracion,
    PaperSize? size,
    bool? conexionStatus}) async {
  final conecttion =
      conexionStatus ?? await PrintBluetoothThermal.connectionStatus;
  if (conecttion) {
    List<int> ticket;
    if (vehicle != null && client != null) {
      final entradaHora = DateFormat("hh:mm a").format(vehicle.entrada);
      ticket = await testTicket(
          name: client.name,
          placa: vehicle.placa,
          servicio: vehicle.typeService,
          horaIngreso: entradaHora,
          //TODO agregar contacto y demas
          correo: configuracion?.correo ?? "a@a.com",
          direccion: configuracion?.direccion ?? "Calle 13",
          telefono: configuracion?.phone ?? "+573213617182",
          title: configuracion?.nameEmpresa ?? "Lavadero POMPILIO",
          lema: configuracion?.lema ?? "Su Autolavado de confianza",
          valor: formatearIntACantidad(vehicle.typePrice),
          optionprinttype: size ?? PaperSize.mm80);
    } else {
      ticket = await testTicket();
    }
    final result = await PrintBluetoothThermal.writeBytes(ticket);
    logger.i("logger.i test result:  $result");
  } else {
    //no conectado, reconecte
  }
}

// A function that generates a ticket with the given information and styling for printing.
// Parameters:
// - name: The name of the client.
// - placa: The vehicle's license plate.
// - servicio: The type of service.
// - horaIngreso: The entry time of the vehicle.
// - valor: The price of the service.
// - correo: The email address.
// - direccion: The address.
// - telefono: The phone number.
// - title: The title for the ticket.
// - lema: The slogan for the ticket.
// - optionprinttype: The paper size for printing.
// Returns a list of integers representing the bytes of the ticket content.
Future<List<int>> testTicket({
  String name = "Andry Hernandez",
  String placa = "Mi corazon",
  String servicio = "Cositas en la cama",
  String horaIngreso = "12:00 am",
  String valor = "0.00",
  String correo = "a@a.com",
  String direccion = "Calle 123",
  String telefono = "+573213617182",
  String title = "Lavadero POMPILIO",
  String lema = "Su Autolavado de confianza",
  PaperSize optionprinttype = PaperSize.mm80,
}) async {
  List<int> bytes = [];
  // Using default profile
  final profile = await CapabilityProfile.load();
  final generator = Generator(optionprinttype, profile);

  //bytes += generator.setGlobalFont(PosFontType.fontA);

  const fontTipe = PosFontType.fontB;
  bytes += generator.reset();
  bytes += generator.setGlobalCodeTable("CP1252");
  bytes += generator.text(
    title,
    styles: const PosStyles(
      align: PosAlign.center,
      height: PosTextSize.size2,
      width: PosTextSize.size2,
    ),
  );
  bytes += generator.text(
    lema,
    styles: const PosStyles(
      align: PosAlign.center,
      fontType: fontTipe,
    ),
    linesAfter: 1,
  );

  bytes += generator.text(
    "Propietario: $name",
  );
  bytes += generator.text(
    "Plcaca: $placa",
  );
  bytes += generator.text(
    "Servicio: $servicio - Valor: ${valor.replaceAll("\$", "")} Pesos",
  );
  bytes += generator.text("Hora de Ingreso: $horaIngreso", linesAfter: 1);
  bytes += generator.text("$direccion - $correo",
      styles: const PosStyles(align: PosAlign.center));
  bytes += generator.text(telefono,
      styles: const PosStyles(align: PosAlign.center), linesAfter: 1);
  bytes += generator.qrcode('https://wa.me/$telefono', size: QRSize.Size2);
  bytes += generator.feed(4);
  //QR code
  return bytes;
}
