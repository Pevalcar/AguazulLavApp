import 'dart:async';

import 'package:aguazullavapp/lib.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

class ConfigPrintScreenPage extends StatefulWidget {
  const ConfigPrintScreenPage({super.key});

  @override
  State<ConfigPrintScreenPage> createState() => _ConfigPrintScreenPageState();
}

class _ConfigPrintScreenPageState extends State<ConfigPrintScreenPage> {
  String _info = "";
  String _msj = '';
  bool connected = false;
  List<BluetoothInfo> items = [];
  final List<String> _options = [
    "Permiso Bluetooth admitido",
    "bluetooth activado",
    "estado de conexión",
    "Actualizar información",
    "Desconeccion de dispositivo",
  ];

  String _selectSize = "2";
  final _txtText = TextEditingController();
  bool _progress = false;
  String _msjprogress = "";

  List<String> options = ["58 mm", "80 mm"];
  String optionprinttype = "80 mm";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurar Impresora'),
        actions: [
          UpdaterConected(contectedo: connected),
          PopupMenuButton(
            elevation: 3.2,
            //initialValue: _options[1],
            onCanceled: () {
              logger.i('You have not chossed anything');
            },
            tooltip: 'Menu',
            onSelected: (Object select) async {
              String sel = select as String;
              if (sel == "Permiso Bluetooth admitido") {
                bool status =
                    await PrintBluetoothThermal.isPermissionBluetoothGranted;
                setState(() {
                  _info = "Permiso Bluetooth admitido: $status";
                });
                //open setting permision if not granted permision
              } else if (sel == "bluetooth activado") {
                bool state = await PrintBluetoothThermal.bluetoothEnabled;
                setState(() {
                  _info = "bluetooth activado: $state";
                });
              } else if (sel == "Actualizar información") {
                initPlatformState();
              } else if (sel == "estado de conexión") {
                final bool result =
                    await PrintBluetoothThermal.connectionStatus;
                setState(() {
                  connected = result;
                  _info = "estado de conexión: $result";
                });
              } else if (sel == "Desconeccion de dispositivo") {
                final bool result = await PrintBluetoothThermal.disconnect;
                setState(() {
                  connected = result;
                  _info = "Desconeccion de dispositivo: $result";
                });
              }
            },
            itemBuilder: (BuildContext context) {
              return _options.map((String option) {
                return PopupMenuItem(
                  value: option,
                  child: Text(option),
                );
              }).toList();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('info: $_info\n '),
              Text(_msj),
              Row(
                children: [
                  const Text("Tipo de impresora: "),
                  const SizedBox(width: 10),
                  DropdownButton<String>(
                    value: optionprinttype,
                    items: options.map((String option) {
                      return DropdownMenuItem<String>(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        optionprinttype = newValue!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await getBluetoots();
                    },
                    child: Row(
                      children: [
                        Visibility(
                          visible: _progress,
                          child: const SizedBox(
                            width: 25,
                            height: 25,
                            child: CircularProgressIndicator.adaptive(
                                strokeWidth: 1, backgroundColor: Colors.white),
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          _progress ? _msjprogress : "Buscar",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      if (connected) {
                        return ElevatedButton(
                          onPressed: () async {
                            await disconnect();
                            if (connected) {
                              return;
                            }
                            ref
                                .read(conectedBluetueProvider.notifier)
                                .setContected(false);
                          },
                          child: const Text("Desconectar"),
                        );
                      } else {
                        return const ElevatedButton(
                          onPressed: null,
                          child: Text("Desconectar"),
                        );
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: connected ? printTest : null,
                    child: const Text("Prueba"),
                  ),
                ],
              ),
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                  child: ListView.builder(
                    itemCount: items.isNotEmpty ? items.length : 0,
                    itemBuilder: (context, index) {
                      return Consumer(
                        builder: (context, ref, child) {
                          return ListTile(
                            leading: const Icon(Icons.print),
                            onTap: () async {
                              String mac = items[index].macAdress;
                              await connect(mac);
                              if (!connected) {
                                return;
                              }
                              ref
                                  .read(conectedBluetueProvider.notifier)
                                  .setContected(true);
                            },
                            title: Text('Nombre: ${items[index].name}'),
                            subtitle:
                                Text("macAddress: ${items[index].macAdress}"),
                          );
                        },
                      );
                    },
                  )),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: Column(children: [
                  const Text("Probar el uso de la impresora bluetooth."),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _txtText,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Texto a imprimir",
                            hintText: "Texto para imprimir",
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      DropdownButton<String>(
                        hint: const Text('Size'),
                        value: _selectSize,
                        items: <String>['1', '2', '3', '4', '5']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? select) {
                          setState(() {
                            _selectSize = select.toString();
                          });
                        },
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: connected ? printWithoutPackage : null,
                    child: const Text("Imprimir"),
                  ),
                ]),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    int porcentbatery = 0;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await PrintBluetoothThermal.platformVersion;
      logger.i("Version de plataforma: $platformVersion");
      porcentbatery = await PrintBluetoothThermal.batteryLevel;
    } on PlatformException {
      platformVersion = 'Fallo al obtener la plataforma.';
    } catch (e) {
      platformVersion = 'Fallo al obtener la plataforma.';
      logger.e("error al obtener la plataforma: $e");
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    bool result = await PrintBluetoothThermal.bluetoothEnabled;
    logger.i("bluetooth enabled: $result");
    if (result) {
      _msj = "Bluetooth activated, Busca y Conecta";
    } else {
      _msj = "Bluetooth no activado";
    }

    result = await PrintBluetoothThermal.connectionStatus;
    setState(() {
      connected = result;
      _info =
          "Estado conexión: ${result ? "Conectado" : "Desconectado"}  \n$platformVersion ($porcentbatery% bateria)";
    });
  }

  Future<void> getBluetoots() async {
    setState(() {
      _progress = true;
      _msjprogress = "Buscando...";
      items = [];
    });
    final List<BluetoothInfo> listResult =
        await PrintBluetoothThermal.pairedBluetooths;

    /*await Future.forEach(listResult, (BluetoothInfo bluetooth) {
      String name = bluetooth.name;
      String mac = bluetooth.macAdress;
    });*/

    setState(() {
      _progress = false;
    });

    if (listResult.isEmpty) {
      _msj =
          "There are no bluetoohs linked, go to settings and link the printer";
    } else {
      _msj = "Toque un elemento en la lista para conectar.";
    }

    setState(() {
      items = listResult;
    });
  }

  Future<void> connect(String mac) async {
    setState(() {
      _progress = true;
      _msjprogress = "Conectando...";
      connected = false;
    });
    final bool result =
        await PrintBluetoothThermal.connect(macPrinterAddress: mac);
    logger.i("state conected $result");
    if (result) connected = true;
    setState(() {
      _progress = false;
    });
  }

  Future<void> disconnect() async {
    final bool status = await PrintBluetoothThermal.disconnect;
    setState(() {
      connected = false;
    });
    logger.i("status disconnect $status");
  }

  Future<void> printTest() async {
    bool conexionStatus = await PrintBluetoothThermal.connectionStatus;
    //logger.i("connection status: $conexionStatus");
    if (conexionStatus) {
      List<int> ticket = await testTicket();
      final result = await PrintBluetoothThermal.writeBytes(ticket);
      logger.i("logger.i test result:  $result");
    } else {
      //no conectado, reconecte
    }
  }

  Future<List<int>> testTicket({
    String name = "Andry Hernandez",
    String placa = "Mi corazon",
    String servicio = "Cositas en la cama",
    String horaIngreso = "12:00 am",
    String correo = "a@a.com",
    String direccion = "Calle 123",
    String telefono = "+573213617182",
  }) async {
    List<int> bytes = [];
    // Using default profile
    final profile = await CapabilityProfile.load();
    final generator = Generator(
        optionprinttype == "58 mm" ? PaperSize.mm58 : PaperSize.mm80, profile);
    //bytes += generator.setGlobalFont(PosFontType.fontA);

    const fontTipe = PosFontType.fontB;
    bytes += generator.reset();
    bytes += generator.text(
      "Lavadero POMPILIO",
      styles: const PosStyles(
        align: PosAlign.center,
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    );
    bytes += generator.text(
      "Su Autolavado de confianza",
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
      "Servicio: $servicio",
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

  Future<void> printWithoutPackage() async {
    //impresion sin paquete solo de PrintBluetoothTermal
    bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
    if (connectionStatus) {
      String text = "${_txtText.text}\n";
      bool result = await PrintBluetoothThermal.writeString(
          printText: PrintTextSize(size: int.parse(_selectSize), text: text));
      logger.i("status logger.i result: $result");
      setState(() {
        _msj = "printed status: $result";
      });
    } else {
      //no conectado, reconecte
      setState(() {
        _msj = "no connected device";
      });
      logger.i("no conectado");
    }
  }
}

class UpdaterConected extends StatelessWidget {
  const UpdaterConected({
    super.key,
    this.contectedo = false,
  });

  final bool contectedo;
  @override
  Widget build(BuildContext context) {
    final color = contectedo ? Colors.green : Colors.red;
    final icon = contectedo ? Icons.check : Icons.close;
    return Icon(icon, color: color);
  }
}
