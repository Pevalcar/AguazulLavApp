import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SERVICETYPE {
  ENJUAGE,
  GENERAL,
  LATAS,
  POLICHADA,
  OTRO,
}

extension ServiceTypeExtension on SERVICETYPE {
  String get name => toString().replaceAll("SERVICETYPE.", "");
}

class AddServiceTypeScreen extends HookConsumerWidget {
  const AddServiceTypeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: const CustomScrollView(slivers: [
        SliverTypeVeicle(),
        SliverToBoxAdapter(
          child: Divider(height: 20),
        ),
        Expanded(
          child: ListServicesTypes(),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context, builder: (context) => const AddTypeForm());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ListServicesTypes extends HookConsumerWidget {
  const ListServicesTypes({
    super.key,
  });

  List<ServiceType> _sortList(List<ServiceType>? list, String querry) {
    List<ServiceType> listFilter = [];
    listFilter = list
            ?.where((element) => element.typeVehiculo
                .toLowerCase()
                .contains(querry.toLowerCase()))
            .toList() ??
        [];
    return listFilter;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiculeType = ref.watch(typoDeVehiculoProvider);
    var filteredList = useState<List<ServiceType>>([]);
    final listServices = ref.watch(serviceTypeListProvider);

    return listServices.when(
      error: (error, stackTrace) =>
          SliverToBoxAdapter(child: Text(error.toString())),
      loading: () => SliverToBoxAdapter(
          child: const Center(child: CircularProgressIndicator())),
      data: (data) {
        filteredList.value = _sortList(data, vehiculeType);
        return SliverList.builder(
          itemCount: filteredList.value.length,
          itemBuilder: (context, index) => ExpansionTile(
              title: Text(filteredList.value[index].clase),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(filteredList.value[index].description),
                  ),
                  Text(filteredList.value[index]
                      .price), //TODO el precio se esta guardando en String y niint posibles problemas
                ],
              ),
              leading: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                          title: const Text("Eliminar Servicio"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text("Cancelar"),
                            ),
                            TextButton(
                              onPressed: () {
                                ref
                                    .read(serviceTypeListProvider.notifier)
                                    .deleteServiceType(
                                        filteredList.value[index]);
                                Navigator.pop(context);
                              },
                              child: const Text("Eliminar"),
                            )
                          ]),
                    );
                  },
                  icon: Icon(Icons.delete)),
              children: [
                Text("Informacion",
                    style: Theme.of(context).textTheme.titleLarge),
                Text(filteredList.value[index].clase),
                Text(filteredList.value[index].description),
                Text(filteredList.value[index].price),
              ]),
        );
      },
    );
  }
}

class SliverTypeVeicle extends HookConsumerWidget {
  const SliverTypeVeicle({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      actions: const [DarkModeButton()],
      floating: true,
      title: DropDownTypeVehicle(
        title: "Servicios",
        typesList: ref.watch(typosDeVeiculosProvider),
        type: ref.watch(typoDeVehiculoProvider),
      ),
    );
  }
}

class AddTypeForm extends HookConsumerWidget {
  const AddTypeForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeSelect = ref.watch(typoDeVehiculoProvider);

    final filters = useState<SERVICETYPE?>(null);
    final keyForm = GlobalKey<FormState>();
    final typeController = useTextEditingController();
    final descriptionController = useTextEditingController();
    final priceController = useTextEditingController();

    const spacer = SizedBox(height: 16);

    ref.listen(typoDeVehiculoProvider, (previous, next) {
      if (next != previous) {
        filters.value = null;
      }
    });

//TODO manejo de la opcion otros
    void submit() async {
      if (keyForm.currentState!.validate()) {
        keyForm.currentState!.save();
        final service = ServiceType(
          typeVehiculo: typeSelect,
          clase:
              typeSelect == "OTRO." ? typeController.text : filters.value!.name,
          description: descriptionController.text,
          price: priceController.text,
        );
        showToast(context, "Agregando Servicio");
        ref.read(serviceTypeListProvider.notifier).addServiceType(service, () {
          showToast(context, "Agregado");
        }, (error) {
          showErrorToast(context, error);
        });
        Navigator.pop(context);
      }
    }

    return AlertDialog(
      scrollable: true,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
        TextButton(
          onPressed: submit,
          child: const Text("Guardar"),
        )
      ],
      title: const Text("Tipo de Servicio"),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: keyForm,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text("Tipo de Vehiculo"),
                spacer,
                DropDownTypeVehicle(
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
                        DescriptionTetField(
                          descriptionController: descriptionController,
                        ),
                        spacer,
                        Text("Precio",
                            style: Theme.of(context).textTheme.titleLarge),
                        spacer,
                        _priceTextField(priceController: priceController),
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
                        DescriptionTetField(
                            descriptionController: descriptionController),
                        spacer,
                        const Text("Precio"),
                        spacer,
                        _priceTextField(priceController: priceController),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
              ],
            ),
          ),
        ),
      ),
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

class DescriptionTetField extends StatelessWidget {
  const DescriptionTetField({
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
