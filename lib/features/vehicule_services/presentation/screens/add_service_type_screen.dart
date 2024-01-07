import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class AddServiceTypeScreen extends HookConsumerWidget {
  const AddServiceTypeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeSelect = ref.watch(typoDeVehiculoProvider);

    final keyForm = GlobalKey<FormState>();
    final filters = useState<SERVICETYPE?>(null);
    final typeController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final priceController = useTextEditingController();

    const spacer = SizedBox(height: 16);

    ref.listen(serviceTypeListProvider, (previous, next) {
      if (previous != next) {
        if (next.hasValue) {
          showToast(context, "Servicio agregado con exito");
        }
        if (next.hasError) {
          showErrorToast(context, next.error.toString());
        }
      }
    });

    void submit() async {
      if (keyForm.currentState!.validate()) {
        keyForm.currentState!.save();
        final service = ServiceType(
          typeVehiculo: typeSelect,
          clase: typeSelect == "OTRO."
              ? typeController.text
              : filters.value.toString().replaceAll("SERVICETYPE.", ""),
          description: descriptionController.text,
          price: priceController.text,
        );
        showToast(context, "Agregando Servicio");
        ref.read(serviceTypeListProvider.notifier).addServiceType(service);
      }
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tipo de Servicio"),
        actions: const [DarkModeButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: keyForm,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text("Tipo de Vehiculo"),
                spacer,
                TypedCardSelector(
                  typesList: ref.watch(typosDeVeiculosProvider),
                  type: typeSelect,
                ),
                spacer,
                Text("Servicio", style: Theme.of(context).textTheme.titleLarge),
                spacer,
                ...typeSelect != "OTRO."
                    ? [ServiciosWrap(filters: filters)]
                    : [
                        TextFormField(
                          controller: typeController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa un tipo de Servicio';
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Escribe el tipo de Servicio",
                            border: UnderlineInputBorder(),
                            helperText: "Tipo de Servicio",
                            hintText: "Tipo de Servicio",
                          ),
                        ),
                        Text("Descripción",
                            style: Theme.of(context).textTheme.titleLarge),
                        spacer,
                        _descriptionTetField(
                          descriptionController: descriptionController,
                        ),
                        spacer,
                        Text("Precio",
                            style: Theme.of(context).textTheme.titleLarge),
                        spacer,
                        _priceTextField(priceController: priceController),
                        AceptForm(
                          submit: submit,
                        )
                      ],
                spacer,
                filters.value == null
                    ? typeSelect != "OTRO."
                        ? const Text("Selecciona un Tipo de Servicio")
                        : spacer
                    : spacer,
                spacer,
                ...filters.value == null
                    ? []
                    : [
                        spacer,
                        Text("Descripción",
                            style: Theme.of(context).textTheme.titleLarge),
                        spacer,
                        _descriptionTetField(
                            descriptionController: descriptionController),
                        spacer,
                        const Text("Precio"),
                        spacer,
                        _priceTextField(priceController: priceController),
                        const SizedBox(
                          height: 8,
                        ),
                        AceptForm(
                          submit: submit,
                        )
                      ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AceptForm extends StatelessWidget {
  final VoidCallback submit;
  const AceptForm({
    super.key,
    required this.submit,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text(
                "¿Estas seguro de agregar este servicio?",
              ),
              actions: [
                TextButton(
                  child: const Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  onPressed: submit,
                  child: const Text("Guardar"),
                )
              ],
            );
          }),
      child: const Text("Guardar"),
    );
  }
}

class _priceTextField extends StatelessWidget {
  const _priceTextField({
    required this.priceController,
  });

  final TextEditingController priceController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: priceController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter()
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa un precio';
        }
        return null;
      },
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        hintText: "Precio",
        helperText: "Precio del Servicio",
      ),
    );
  }
}

class _descriptionTetField extends StatelessWidget {
  const _descriptionTetField({
    required this.descriptionController,
  });

  final TextEditingController descriptionController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: descriptionController,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        hintText: "Descripción",
        helperText: "Descripción del Servicio",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa una descripción';
        } else if (value.length > 300) {
          return 'La descripción es demasiado larga';
        }
        return null;
      },
    );
  }
}

class ServiciosWrap extends HookWidget {
  final filters;
  const ServiciosWrap({
    super.key,
    required this.filters,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 16.0,
      spacing: 16.0,
      children: SERVICETYPE.values.map((SERVICETYPE service) {
        return ChoiceChip(
          label: Text(service.name),
          selected: filters.value == service,
          onSelected: (bool selected) {
            filters.value = selected ? service : SERVICETYPE.ENJUAGE;
          },
        );
      }).toList(),
    );
  }
}

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return newValue;
    }
    double value = double.parse(newValue.text);
    final formatter =
        NumberFormat.simpleCurrency(locale: "es_MX", decimalDigits: 2);
    String newText = formatter.format(value / 100);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }
}


//TODO Agregar Skeletons