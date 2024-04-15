import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuracion'),
        centerTitle: true,
        actions: const [DarkModeButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (_) => PinAccesDialog(
                                correctPass: () =>
                                    const ConfigPinPassRoute().push(context),
                              ));
                    },
                    child: const Text('Configurar Pin')),
                const SizedBox(height: 25),
                const Text('Configuracion de Comiciones'),
                const SizedBox(height: 25),
                const ComicionTextFiel(),
                //nombre
                const GeneralTextFields(),
                //lema
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GeneralTextFields extends HookConsumerWidget {
  const GeneralTextFields({
    super.key,
  });

  String formaterNumber(String? number, String langage) {
    if (number == null) return "";
    String numberFormated = "";
    List numberArray = number
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(" ", "")
        .split("");

    if (langage == "CO") {
      for (int i = 0; i < numberArray.length; i++) {
        String n = numberArray[i];
        if (i < 3) {
          continue;
        } else {
          numberFormated = numberFormated + n;
        }
      }
      return numberFormated;
    }
    return numberFormated;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final configuraciones = ref.watch(configuracionesProvider);
    PhoneNumber? numberProne;
    const langage = "CO";
    return configuraciones.when(
        data: (configuraciones) => Column(
              children: [
                TextField(
                  controller:
                      TextEditingController(text: configuraciones?.nameEmpresa),
                  onSubmitted: (value) {
                    ref
                        .read(configuracionesProvider.notifier)
                        .setConfiguraciones(
                          configuraciones?.copyWith(nameEmpresa: value),
                        );
                  },
                  keyboardType: TextInputType.text,
                  maxLength: 30,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre del comercio",
                  ),
                ),
                TextField(
                  controller:
                      TextEditingController(text: configuraciones?.lema),
                  onSubmitted: (value) {
                    ref
                        .read(configuracionesProvider.notifier)
                        .setConfiguraciones(
                          configuraciones?.copyWith(lema: value),
                        );
                  },
                  keyboardType: TextInputType.text,
                  maxLength: 60,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Lema del negocio",
                  ),
                ),
                TextField(
                  controller:
                      TextEditingController(text: configuraciones?.correo),
                  onSubmitted: (value) {
                    ref
                        .read(configuracionesProvider.notifier)
                        .setConfiguraciones(
                          configuraciones?.copyWith(correo: value),
                        );
                  },
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 30,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Correo del comercio",
                  ),
                ),
                IntlPhoneField(
                  languageCode: 'es',
                  initialValue: formaterNumber(configuraciones?.phone, langage),
                  onChanged: (value) {
                    numberProne = value;
                  },
                  onSubmitted: (value) {
                    if (numberProne != null) {
                      logger.i(numberProne?.completeNumber);
                      ref
                          .read(configuracionesProvider.notifier)
                          .setConfiguraciones(
                            configuraciones?.copyWith(
                                phone:
                                    "(${numberProne?.countryCode}) ${numberProne?.number}"),
                          );
                    }
                  },
                  initialCountryCode: "CO",
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: "Celular del comercio",
                  ),
                ),
                TextField(
                  controller:
                      TextEditingController(text: configuraciones?.direccion),
                  onSubmitted: (value) {
                    ref
                        .read(configuracionesProvider.notifier)
                        .setConfiguraciones(
                          configuraciones?.copyWith(direccion: value),
                        );
                  },
                  keyboardType: TextInputType.streetAddress,
                  maxLength: 30,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Direccion del comercio",
                  ),
                )
              ],
            ),
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => const Skeletonizer(
                child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre del comercio",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Lema del negocio",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Correo del comercio",
                  ),
                ),
                IntlPhoneField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    labelText: "Celular del comercio",
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Direccion del comercio",
                  ),
                )
              ],
            )));
  }
}

class ComicionTextFiel extends HookConsumerWidget {
  const ComicionTextFiel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    controller.text =
        ref.watch(comicionProvider).asData?.value.toString() ?? "";

    return TextField(
      controller: controller,
      onSubmitted: (value) {
        ref.read(comicionProvider.notifier).setComicion(int.parse(value));
      },
      keyboardType: TextInputType.number,
      maxLength: 2,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Configuracion de Comiciones',
          suffix: Text("%")),
    );
  }
}
