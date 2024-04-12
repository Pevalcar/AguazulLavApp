import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pluto_grid/pluto_grid.dart';

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
      appBar: AppBar(
        title: const Text("Tipos de Servicios"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(serviceTypeListProvider.notifier).loadData();
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
          const DarkModeButton()
        ],
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) =>
            constraints.maxWidth > 600
                ? const GripPuto()
                : const CustomScrollView(
                    slivers: [
                      // SliverTypeVeicle(),
                      DropSelecte(),
                      SliverToBoxAdapter(
                        child: Divider(height: 20),
                      ),
                      ListServicesTypes()
                    ],
                  ),
      ),
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

class GripPuto extends HookConsumerWidget {
  const GripPuto({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PlutoGridStateManager? stateManager;
    final listServices = ref.watch(serviceTypeListProvider);

    return listServices.when(
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (data) {
        List<PlutoColumn> columns = [
          /// Text Column definition
          PlutoColumn(
            readOnly: true,
            title: 'ID',
            field: 'id',
            type: PlutoColumnType.text(),
            width: 80,
            minWidth: 80,
          ),

          /// Number Column definition
          PlutoColumn(
            title: 'Vehiculo',
            field: 'typeVehiculo',
            type: PlutoColumnType.select(ref.watch(typosDeVeiculosProvider)),
          ),

          /// Select Column definition
          // PlutoColumn(
          //   title: 'Clase',
          //   field: 'clase',
          //   type: PlutoColumnType.select(['item1', 'item2', 'item3']),
          // ),
          PlutoColumn(
            title: 'Clase',
            field: 'clase',
            type: PlutoColumnType.select([
              'ENJUAGE',
              'GENERAL',
              'LATAS',
              'POLICHADA',
              'OTRO',
            ]),
          ),
          PlutoColumn(
            title: 'Descripción',
            field: 'description',
            type: PlutoColumnType.text(),
          ),
          PlutoColumn(
            title: 'Precio',
            field: 'price',
            type: PlutoColumnType.currency(
              locale: 'es_CO',
              symbol: '\$',
              format: '\u00A4 #,###.##',
            ),
          ),
          PlutoColumn(
            title: 'DeleteRow',
            field: 'delete',
            type: PlutoColumnType.text(),
            enableColumnDrag: false,
            renderer: (rendererContext) => Row(children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Eliminar Registro'),
                      content: const Text('¿Desea eliminar el registro?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            final service = data?[rendererContext.row.sortIdx];
                            ref
                                .read(serviceTypeListProvider.notifier)
                                .deleteServiceType(service!);
                            stateManager?.removeRows([rendererContext.row]);
                            Navigator.pop(context);
                          },
                          child: const Text('Eliminar'),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.delete,
                ),
                iconSize: 18,
                color: Colors.red,
                padding: const EdgeInsets.all(0),
              ),
              Expanded(
                child: Text(
                  rendererContext.row.cells[rendererContext.column.field]!.value
                      .toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]),
          )

          /// Datetime Column definition
          // PlutoColumn(
          //   title: 'date column',
          //   field: 'description',
          //   type: PlutoColumnType.date(),
          // ),

          /// Time Column definition
          // PlutoColumn(
          //   title: 'time column',
          //   field: 'price',
          //   type: PlutoColumnType.time(),
          // ),
        ];

        List<PlutoRow> rows = data
                ?.map((e) => PlutoRow(cells: {
                      'id': PlutoCell(value: e.servicioId),
                      'typeVehiculo': PlutoCell(value: e.typeVehiculo),
                      'clase': PlutoCell(value: e.clase),
                      'description': PlutoCell(value: e.description),
                      'price': PlutoCell(value: correctionPrice(e.price)),
                      'delete': PlutoCell(value: "delete"),
                    }))
                .toList() ??
            [];
        return Container(
          padding: const EdgeInsets.all(15),
          child: PlutoGrid(
              columns: columns,
              rows: rows,
              onChanged: (PlutoGridOnChangedEvent event) {
                final newDataa = newData(event, data);
                if (newDataa == null) return;
                ref
                    .read(serviceTypeListProvider.notifier)
                    .modifieServiceType(newDataa);
              },
              onLoaded: (PlutoGridOnLoadedEvent event) {
                stateManager = event.stateManager;
                stateManager?.setSelectingMode(PlutoGridSelectingMode.cell);
                stateManager?.setShowColumnFilter(true);
              }),
        );
      },
    );
  }

  ServiceType? newData(PlutoGridOnChangedEvent event, List<ServiceType>? data) {
    final id = event.row.cells['id']!.value;
    final service = data?.firstWhere((element) => element.servicioId == id);

    return service?.copyWith(
      typeVehiculo: event.row.cells['typeVehiculo']!.value,
      clase: event.row.cells['clase']!.value,
      description: event.row.cells['description']!.value,
      price: event.row.cells['price']!.value.toInt().toString(),
    );
  }

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
}

class DropSelecte extends HookConsumerWidget {
  const DropSelecte({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: DropDownTypeVehicle(
        title: "Vehiculo:",
        typesList: ref.watch(typosDeVeiculosProvider),
        type: ref.watch(typoDeVehiculoProvider),
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
      loading: () => const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator())),
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
                  icon: const Icon(Icons.delete)),
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
                DropdownButton(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    dropdownColor: Theme.of(context).secondaryHeaderColor,
                    value: typeSelect,
                    items: ref
                        .watch(typosDeVeiculosProvider)
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (value) {
                      ref
                          .read(typoDeVehiculoProvider.notifier)
                          .modifyTypo(value ?? "");
                    }),
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

class SliverTypeVeicle extends HookConsumerWidget {
  const SliverTypeVeicle({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SliverAppBar(
      actions: [DarkModeButton()],
      floating: true,
      title: Text("Tipos de Servicios"),
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
