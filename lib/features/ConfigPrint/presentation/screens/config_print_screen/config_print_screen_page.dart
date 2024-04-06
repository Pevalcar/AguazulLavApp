import 'dart:async';
import 'dart:io';

import 'package:aguazullavapp/lib.dart';
import 'package:esc_pos_utils_plus/esc_pos_utils_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image/image.dart' as img;
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
    "Actualizar información"
  ];

  String _selectSize = "2";
  final _txtText = TextEditingController(text: "Hola Como estas");
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
              print('You have not chossed anything');
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
                  const Text("Type print"),
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
                    onPressed: () {
                      this.getBluetoots();
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
                        const SizedBox(width: 5),
                        Text(_progress ? _msjprogress : "Buscar"),
                      ],
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, child) {
                      if (connected) {
                        return ElevatedButton(
                          onPressed: () async {
                            await this.disconnect();
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
                        return ElevatedButton(
                          onPressed: null,
                          child: const Text("Desconectar"),
                        );
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: connected ? this.printTest : null,
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
                    itemCount: items.length > 0 ? items.length : 0,
                    itemBuilder: (context, index) {
                      return Consumer(
                        builder: (context, ref, child) {
                          return ListTile(
                            leading: const Icon(Icons.print),
                            onTap: () async {
                              String mac = items[index].macAdress;
                              await this.connect(mac);
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
                  const Text(
                      "Tamaño de texto sin biblioteca ni paquetes externos, imprimir imágenes pero sin usar una biblioteca."),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _txtText,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Texto",
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
                            child: new Text(value),
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
                    onPressed: connected ? this.printWithoutPackage : null,
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
      print("Version de plataforma: $platformVersion");
      porcentbatery = await PrintBluetoothThermal.batteryLevel;
    } on PlatformException {
      platformVersion = 'Fallo al obtener la plataforma.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    bool result = await PrintBluetoothThermal.bluetoothEnabled;
    print("bluetooth enabled: $result");
    if (result) {
      _msj = "Bluetooth activated, Busca y Conecta";
    } else {
      _msj = "Bluetooth no activado";
    }

    result = await PrintBluetoothThermal.connectionStatus;
    setState(() {
      connected = result;
      _info = "Estado conexión: ${result ? "Conectado" : "Desconectado"}  \n" +
          platformVersion +
          " ($porcentbatery% bateria)";
    });
  }

  Future<void> getBluetoots() async {
    setState(() {
      _progress = true;
      _msjprogress = "Buscando dispositivos...";
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

    if (listResult.length == 0) {
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
    print("state conected $result");
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
    print("status disconnect $status");
  }

  Future<void> printTest() async {
    bool conexionStatus = await PrintBluetoothThermal.connectionStatus;
    //print("connection status: $conexionStatus");
    if (conexionStatus) {
      List<int> ticket = await testTicket();
      final result = await PrintBluetoothThermal.writeBytes(ticket);
      print("print test result:  $result");
    } else {
      //no conectado, reconecte
    }
  }

  Future<void> printString() async {
    bool conexionStatus = await PrintBluetoothThermal.connectionStatus;
    if (conexionStatus) {
      String enter = '\n';
      await PrintBluetoothThermal.writeBytes(enter.codeUnits);
      //size of 1-5
      String text = "Hello";
      await PrintBluetoothThermal.writeString(
          printText: PrintTextSize(size: 1, text: text));
      await PrintBluetoothThermal.writeString(
          printText: PrintTextSize(size: 2, text: text + " size 2"));
      await PrintBluetoothThermal.writeString(
          printText: PrintTextSize(size: 3, text: text + " size 3"));
    } else {
      //desconectado
      print("desconectado bluetooth $conexionStatus");
    }
  }

  Future<List<int>> testTicket() async {
    List<int> bytes = [];
    // Using default profile
    final profile = await CapabilityProfile.load();
    final generator = Generator(
        optionprinttype == "58 mm" ? PaperSize.mm58 : PaperSize.mm80, profile);
    //bytes += generator.setGlobalFont(PosFontType.fontA);
    bytes += generator.reset();

    final ByteData data = await rootBundle.load('assets/mylogo.jpg');
    final Uint8List bytesImg = data.buffer.asUint8List();
    img.Image? image = img.decodeImage(bytesImg);

    if (Platform.isIOS) {
      // Resizes the image to half its original size and reduces the quality to 80%
      final resizedImage = img.copyResize(image!,
          width: image.width ~/ 1.3,
          height: image.height ~/ 1.3,
          interpolation: img.Interpolation.nearest);
      final bytesimg = Uint8List.fromList(img.encodeJpg(resizedImage));
      //image = img.decodeImage(bytesimg);
    }

    //Using `ESC *`
    bytes += generator.image(image!);

    bytes += generator.text(
        'Regular: aA bB cC dD eE fF gG hH iI jJ kK lL mM nN oO pP qQ rR sS tT uU vV wW xX yY zZ');
    bytes += generator.text('Special 1: ñÑ àÀ èÈ éÉ üÜ çÇ ôÔ',
        styles: const PosStyles(codeTable: 'CP1252'));
    bytes += generator.text('Special 2: blåbærgrød',
        styles: const PosStyles(codeTable: 'CP1252'));

    bytes += generator.text('Bold text', styles: const PosStyles(bold: true));
    bytes +=
        generator.text('Reverse text', styles: const PosStyles(reverse: true));
    bytes += generator.text('Underlined text',
        styles: const PosStyles(underline: true), linesAfter: 1);
    bytes += generator.text('Align left',
        styles: const PosStyles(align: PosAlign.left));
    bytes += generator.text('Align center',
        styles: const PosStyles(align: PosAlign.center));
    bytes += generator.text('Align right',
        styles: const PosStyles(align: PosAlign.right), linesAfter: 1);

    bytes += generator.row([
      PosColumn(
        text: 'col3',
        width: 3,
        styles: const PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col6',
        width: 6,
        styles: const PosStyles(align: PosAlign.center, underline: true),
      ),
      PosColumn(
        text: 'col3',
        width: 3,
        styles: const PosStyles(align: PosAlign.center, underline: true),
      ),
    ]);

    //barcode

    final List<int> barData = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 4];
    bytes += generator.barcode(Barcode.upcA(barData));

    //QR code
    bytes += generator.qrcode('example.com');

    bytes += generator.text(
      'Text size 50%',
      styles: const PosStyles(
        fontType: PosFontType.fontB,
      ),
    );
    bytes += generator.text(
      'Text size 100%',
      styles: const PosStyles(
        fontType: PosFontType.fontA,
      ),
    );
    bytes += generator.text(
      'Text size 200%',
      styles: const PosStyles(
        height: PosTextSize.size2,
        width: PosTextSize.size2,
      ),
    );

    bytes += generator.feed(2);
    //bytes += generator.cut();
    return bytes;
  }

  Future<void> printWithoutPackage() async {
    //impresion sin paquete solo de PrintBluetoothTermal
    bool connectionStatus = await PrintBluetoothThermal.connectionStatus;
    if (connectionStatus) {
      String text = _txtText.text.toString() + "\n";
      bool result = await PrintBluetoothThermal.writeString(
          printText: PrintTextSize(size: int.parse(_selectSize), text: text));
      print("status print result: $result");
      setState(() {
        _msj = "printed status: $result";
      });
    } else {
      //no conectado, reconecte
      setState(() {
        _msj = "no connected device";
      });
      print("no conectado");
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
