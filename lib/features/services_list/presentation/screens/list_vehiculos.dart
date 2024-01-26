import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:uuid/uuid.dart';

//TODO posibilidad de ver el informe desde esta pantalla
class ListVehicles extends HookConsumerWidget {
  const ListVehicles({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabcontroller = useTabController(initialLength: 2);
    return Scaffold(
      appBar: AppBar(title: const Text('Servicios'), actions: [
        IconButton(
            onPressed: () {
              ref.read(jornadaStateProvider.notifier).reloadJornada();
            },
            icon: const Icon(Icons.refresh)),
        const DarkModeButton()
      ]),
      body: SafeArea(
        child: Column(
          children: [
            const InformacionJornada(),
            TabBar(
              controller: tabcontroller,
              tabs: const [
                Tab(
                  child: Text('Vehiculos'),
                ),
                Tab(
                  child: Text('Entradas y salidas'),
                ),
              ],
            ),
            Expanded(
                child: TabBarView(controller: tabcontroller, children: const [
              ListaVehiculos(),
              EntradasSalidasList(),
            ]))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(firebaseControlProvider.notifier).signOut();
          ref.read(vehiculoStateProvider.notifier).addVehiculoTest(
              () => showToast(context, 'Vehiculo Agregado'), null);
        },
        child: Row(
          children: const [
            Icon(Icons.warning_amber),
            Icon(Icons.add),
          ],
        ),
      ),
    );
  }
}

class EntradasSalidasList extends HookConsumerWidget {
  const EntradasSalidasList({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entradasSalidaList = ref.watch(entradaSalidaListProvider);
    return entradasSalidaList.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Assets.images.emptyList.image(width: 250, height: 250),
            );
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return EntradaSalidaCard(
                information: data[index],
              );
            },
          );
        },
        loading: () => ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return EntradaSalidaCard(
                    information: EntradaSalida(
                  concepto: 'Cargando',
                  valor: 0,
                ));
              },
            ),
        error: (error, stackTrace) => Text(error.toString()));
  }
}

//TODO Admin PErmises para dar permisos
class EntradaSalidaCard extends StatelessWidget {
  final EntradaSalida _informacion;
  const EntradaSalidaCard({
    super.key,
    required EntradaSalida information,
  }) : _informacion = information;
  @override
  Widget build(BuildContext context) {
    final formateadorFecha = DateFormat('dd/MM/yyyy');
    final dateDay = formateadorFecha.format(DateTime(
        _informacion.fecha?.year ?? 0,
        _informacion.fecha?.month ?? 0,
        _informacion.fecha?.day ?? 0));

    final dateHour =
        "${_informacion.fecha?.hour ?? 0}:${_informacion.fecha?.minute ?? 0}";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Card(
        color: _informacion.entrada
            ? (Colors.green[100] ?? Colors.green)
            : Colors.red[100] ?? Colors.red,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              width: 1,
              color: _informacion.entrada
                  ? (Colors.green[300] ?? Colors.green)
                  : Colors.red[300] ?? Colors.red,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(_informacion.concepto,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _informacion.entrada
                            ? (Colors.green[600] ?? Colors.green)
                            : Colors.red[600] ?? Colors.red,
                      )),
              Text("Fecha: $dateDay"),
              Text("Hora: $dateHour"),
              Text(formatearIntACantidad(_informacion.valor),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
            ]),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete,
                    color: _informacion.entrada
                        ? (Colors.green[600] ?? Colors.green)
                        : Colors.red[600] ?? Colors.red)),
          ]),
        ),
      ),
    );
  }
}

class InformacionJornada extends HookConsumerWidget {
  const InformacionJornada({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialCountFormKey = GlobalKey<FormState>();
    final jornada = ref.watch(jornadaStateProvider);
    final cajainicialController = useTextEditingController();
    return jornada.when(
      loading: () => const Center(child: Text("Cargando...")),
      error: (error, stackTrace) {
        logger.e(error.toString(), stackTrace: stackTrace);
        return Text(error.toString());
      },
      data: (data) {
        var enjornada = data?.enJornada ?? false;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context)
                  .colorScheme
                  .onSecondaryContainer
                  .withOpacity(.2),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialogOKJornada(
                        title: enjornada
                            ? "¿Desea finalizar la jornada?"
                            : "¿Desea iniciar la jornada?",
                        onAcept: () {
                          if (enjornada) {
                            ref
                                .read(jornadaStateProvider.notifier)
                                .finalizarJornada((String message) {
                              showToast(context, message);
                            }, (String message) {
                              showErrorToast(context, message);
                            });
                          } else {
                            if (!initialCountFormKey.currentState!
                                .validate()) {
                              return;
                            }
                            ref
                                .read(jornadaStateProvider.notifier)
                                .iniciarJornada(correctionPrice(
                                    cajainicialController.text));
                          }
                        },
                      ),
                    );
                  },
                  child: Text(
                    enjornada ? "Finalizar Jornada" : "Iniciar Jornada",
                  ),
                ),
                ElevatedButton(
                    onPressed: !enjornada
                        ? null
                        : () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => EntradaSalidaDialog(
                                    good: true,
                                    onAdd: (EntradaSalida doc) {
                                      ref
                                          .read(entradaSalidaListProvider
                                              .notifier)
                                          .addEntradaSalida(doc);
                                    }));
                          },
                    child: const Text("Entrada")),
                ElevatedButton(
                    onPressed: !enjornada
                        ? null
                        : () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => EntradaSalidaDialog(
                                good: false,
                                onAdd: (EntradaSalida doc) {
                                  ref
                                      .read(entradaSalidaListProvider.notifier)
                                      .addEntradaSalida(doc);
                                },
                              ),
                            );
                          },
                    child: const Text("Salida")),
              ]),
              TextToTextFieldIniciaBase(
                formKey: initialCountFormKey,
                onSubmitedtext: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialogOKJornada(
                      title: "¿Desea iniciar la jornada?",
                      onAcept: () {
                        if (enjornada) {
                          ref
                              .read(jornadaStateProvider.notifier)
                              .finalizarJornada((String message) {
                            showToast(context, message);
                          }, (String message) {
                            showErrorToast(context, message);
                          });
                        } else {
                          ref
                              .read(jornadaStateProvider.notifier)
                              .iniciarJornada(
                                  correctionPrice(cajainicialController.text));
                        }
                      },
                    ),
                  );
                },
                iniciatejornada: enjornada,
                cajainicialController: cajainicialController,
              ),
              StadisticRow(
                title: 'Salida',
                valor: data?.salidas ?? 0,
                good: false,
              ),
              StadisticRow(
                title: 'Entrada',
                valor: data?.entradas ?? 0,
                good: true,
              ),
              StadisticRow(
                title: 'Ingresos',
                valor: data?.ingresos ?? 0,
                good: true,
              ),
              StadisticStringRow(
                title: 'Servicios Realizados',
                valor: data?.procesos ?? "0 / 0",
                good: null,
              ),
              StadisticRow(
                title: 'Total',
                valor: data?.total ?? 0,
                good: (data?.total ?? 0) >= 0 ? true : false,
              ),
            ]),
          ),
        );
      },
    );
  }
}

class EntradaSalidaDialog extends HookWidget {
  final bool _good;
  final Function(EntradaSalida) _onAdd;
  const EntradaSalidaDialog(
      {super.key, required bool good, required Function(EntradaSalida) onAdd})
      : _good = good,
        _onAdd = onAdd;
  @override
  Widget build(BuildContext context) {
    final controllerTextConcepto = useTextEditingController();
    final controllerTextValor = useTextEditingController();
    return AlertDialog(
      title: Text(_good ? "Agregar Entrada" : "Agregar salida"),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        const Text("Concepto:"),
        TextFormField(controller: controllerTextConcepto),
        const Text("Valor:"),
        TextFormField(
          controller: controllerTextValor,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CurrencyInputFormatter(),
          ],
        ),
      ]),
      actions: [
        TextButton(
            child: const Text("Cencelar"),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        TextButton(
            child: const Text("Aceptar"),
            onPressed: () {
              _onAdd(EntradaSalida(
                id: const Uuid().v4(),
                entrada: _good,
                fecha: DateTime.now(),
                concepto: controllerTextConcepto.text,
                valor: correctionPrice(controllerTextValor.text),
              ));
              Navigator.of(context).pop();
            })
      ],
    );
  }
}

class StadisticRow extends StatelessWidget {
  const StadisticRow(
      {super.key,
      required String title,
      required int valor,
      required bool? good})
      : _title = title,
        _valor = valor,
        _good = good;

  final String _title;
  final int _valor;
  final bool? _good;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Divider(thickness: 1, color: Theme.of(context).colorScheme.outline),
        Text(
          formatearIntACantidad(_valor),
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: _good == null
                  ? Theme.of(context).colorScheme.outline
                  : _good!
                      ? Colors.green
                      : Colors.red),
        ),
      ],
    );
  }
}

class StadisticStringRow extends StatelessWidget {
  const StadisticStringRow(
      {super.key,
      required String title,
      required String valor,
      required bool? good})
      : _title = title,
        _valor = valor,
        _good = good;

  final String _title;
  final String _valor;
  final bool? _good;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          _title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Divider(thickness: 1, color: Theme.of(context).colorScheme.outline),
        Text(
          _valor,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: _good == null
                  ? Theme.of(context).colorScheme.outline
                  : _good!
                      ? Colors.green
                      : Colors.red),
        ),
      ],
    );
  }
}

class TextToTextFieldIniciaBase extends HookConsumerWidget {
  const TextToTextFieldIniciaBase({
    super.key,
    required bool iniciatejornada,
    required TextEditingController cajainicialController,
    required Function() onSubmitedtext,
    required GlobalKey<FormState> formKey,
  })  : _iniciatejornada = iniciatejornada,
        _cajainicialController = cajainicialController,
        _onSubmitedtext = onSubmitedtext,
        _formKey = formKey;

  final bool _iniciatejornada;
  final TextEditingController _cajainicialController;
  final Function() _onSubmitedtext;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int? caja =
        ref.watch(jornadaStateProvider).asData?.value?.cajaInicial;
    return _iniciatejornada
        ? StadisticRow(title: "Caja inicial ", valor: caja ?? 0, good: null)
        : Form(
            key: _formKey,
            child: TextFormField(
              autofocus: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CurrencyInputFormatter()
              ],
              controller: _cajainicialController,
              decoration: const InputDecoration(
                hintText: "Caja inicial",
                labelText: 'Caja base',
                icon: Icon(Icons.numbers),
                border: UnderlineInputBorder(),
                helperText: "Caja base",
              ),
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    correctionPrice(value) == 0) {
                  return "Agregar un valor";
                }
                return null;
              },
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value) {
                if (_formKey.currentState!.validate()) {
                  _onSubmitedtext();
                }
              },
              textInputAction: TextInputAction.done,
            ),
          );
  }
}

class AlertDialogOKJornada extends StatelessWidget {
  final Function() onAcept;

  const AlertDialogOKJornada(
      {super.key, required this.onAcept, required String title})
      : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(_title),
        content: const Text("Dese Agregar los Cambio y Continuar?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancelar"),
          ),
          TextButton(
            onPressed: () {
              onAcept();
              Navigator.of(context).pop();
            },
            child: const Text("Continuar"),
          )
        ]);
  }
}

class ListaVehiculos extends HookConsumerWidget {
  const ListaVehiculos({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listServices = ref.watch(serviceListProvider);

    return listServices.when(
        data: (data) {
          if (data.isEmpty) {
            return Center(
              child: Assets.images.emptyList.image(width: 250, height: 250),
            );
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return CardCarService(
                key:  Key(data[index].id),
                vehicle: data[index],
              );
            },
          );
        },
        error: (error, stackTrace) => Text(error.toString()),
        loading: () => ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Skeletonizer(
                  child: Card(
                      child: SizedBox(
                    height: 150,
                    width: double.infinity,
                  )),
                );
              },
            ));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(
      {required TabBar tabBar, required Color backgroundColor})
      : _tabBar = tabBar,
        _backgroundColor = backgroundColor;

  final TabBar _tabBar;
  final Color _backgroundColor;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: _backgroundColor, child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
