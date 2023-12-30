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
    
    final _keyForm = GlobalKey<FormState>();
    final filters = useState<SERVICETYPE?>(null);
    final descriptionController = useTextEditingController();
    final priceController = useTextEditingController();

    final spacer = SizedBox(height: 16);

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

    void _submit() async {
      if (_keyForm.currentState!.validate()) {
        _keyForm.currentState!.save();
        final service = ServiceType(
          typeVehiculo: typeSelect,
          clase: filters.value.toString(),
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
        actions: [const DarkModeButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _keyForm,
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
                const Text("Servicio"),
                spacer,
                typeSelect != "OTRO."
                    ? ServiciosWrap(filters: filters)
                    : TextFormField(),
                spacer,
                filters.value == null
                    ? const Text("Selecciona un Tipo de Servicio")
                    : spacer,
                spacer,
                ...filters.value == null
                    ? []
                    : [
                        spacer,
                        Text("Descripción",
                            style: Theme.of(context).textTheme.titleLarge),
                        spacer,
                        TextFormField(
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
                        ),
                        spacer,
                        const Text("Precio"),
                        spacer,
                        TextFormField(
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
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ElevatedButton(
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
                                      child: const Text("Guardar"),
                                      onPressed: _submit,
                                    )
                                  ],
                                );
                              }),
                          child: const Text("Guardar"),
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
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}


//TODO Agregar Skeletons