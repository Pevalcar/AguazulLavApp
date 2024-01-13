import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListVehiculos extends HookConsumerWidget {
  const ListVehiculos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _iniciarJornada = useState(true);
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(serviceListProvider.notifier).loadData();
          },
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            primary: true,
            slivers: [
              SliverAppBar(
                primary: true,
                pinned: true,
                elevation: 10.0,
                flexibleSpace:
                    InformacionJornada(iniciarJornada: _iniciarJornada),
                expandedHeight: MediaQuery.of(context).size.height *
                    (_iniciarJornada.value ? 0.6 : 0.5),
                actions: const [DarkModeButton()],
              ),
              const ListaVehiculos(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(firebaseControlProvider.notifier).signOut();
          ref
              .read(vehiculoStateProvider.notifier)
              .addVehiculo(() => showToast(context, 'Vehiculo Agregado'), null);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class InformacionJornada extends HookConsumerWidget {
  const InformacionJornada({
    required ValueNotifier<bool> iniciarJornada,
    super.key,
  }) : _iniciarJornada = iniciarJornada;

  final ValueNotifier<bool> _iniciarJornada;

  _mostrarAlertDialogo(
      BuildContext context, String _title, Function() onAcept, bool jornada) {
    showDialog(
      context: context,
      builder: (context) => AlertDialogOKJornada(
        title: _title,
        onAcept: () {
          if (jornada) {
            //TODO finalizar jornada
          } else {
            //TODO iniciar jornada
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _cajainicialController = useTextEditingController();
    return FlexibleSpaceBar(
      title: Text('Listado de Servicios',
          style: Theme.of(context).textTheme.titleLarge),
      background: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                _mostrarAlertDialogo(
                    context,
                    _iniciarJornada.value
                        ? "¿Desea iniciar la jornada?"
                        : "¿Desea finalizar la jornada?", () {
                  _iniciarJornada.value = !_iniciarJornada.value;
                }, _iniciarJornada.value);
              },
              child: Text(_iniciarJornada.value
                  ? "Iniciar Jornada"
                  : "Finalizar Jornada"),
            ),
            TextToTextFieldIniciaBase(
                onSubmitedtext: () {
                  _mostrarAlertDialogo(context, "¿Desea iniciar la jornada?",
                      () {
                    _iniciarJornada.value = !_iniciarJornada.value;
                  }, _iniciarJornada.value);
                },
                iniciatejornada: _iniciarJornada,
                cajainicialController: _cajainicialController),
            const StadisticRow(
              title: 'Salida',
              valor: '\$50000',
              good: false,
            ),
            const StadisticRow(
              title: 'Entrada',
              valor: '\$50000',
              good: true,
            ),
            const StadisticRow(
              title: 'Ingresos',
              valor: '\$50000',
              good: true,
            ),
            const StadisticRow(
              title: 'Servicios Realizados',
              valor: ' 1 de (15)',
              good: null,
            ),
            const StadisticRow(
              title: 'Total',
              valor: '50000',
              good: false, //TODO depende si gana o peirde colorea
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ElevatedButton(
                  onPressed: () {
                    //TODO  agregargastos y entradas no contables
                  },
                  child: const Text("Entrada")),
              ElevatedButton(
                  onPressed: () {
                    //TODO  agregargastos y entradas no contables
                  },
                  child: const Text("Salida")),
            ]),
          ],
        ),
      ),
      centerTitle: true,
      titlePadding: const EdgeInsets.all(16.0),
    );
  }
}

class StadisticRow extends StatelessWidget {
  const StadisticRow(
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
          '${_valor}',
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

class TextToTextFieldIniciaBase extends StatelessWidget {
  const TextToTextFieldIniciaBase({
    super.key,
    required ValueNotifier<bool> iniciatejornada,
    required TextEditingController cajainicialController,
    required Function() onSubmitedtext,
  })  : _iniciatejornada = iniciatejornada,
        _cajainicialController = cajainicialController,
        _onSubmitedtext = onSubmitedtext;

  final ValueNotifier<bool> _iniciatejornada;
  final TextEditingController _cajainicialController;
  final Function() _onSubmitedtext;

  @override
  Widget build(BuildContext context) {
    return !_iniciatejornada.value
        ? StadisticRow(
            title: "Caja inicial ",
            valor: _cajainicialController.text,
            good: null)
        : TextFormField(
            autofocus: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _cajainicialController,
            decoration: const InputDecoration(
              hintText: "Caja inicial",
              labelText: 'Caja base',
              icon: Icon(Icons.numbers),
              border: UnderlineInputBorder(),
              helperText: "Caja base",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Agregar un valor";
              }
              return null;
            },
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) => _onSubmitedtext(),
            textInputAction: TextInputAction.done,
          );
  }
}

class AlertDialogOKJornada extends StatelessWidget {
  const AlertDialogOKJornada(
      {super.key, required Function() onAcept, required String title})
      : _onAcept = onAcept,
        _title = title;

  final Function() _onAcept;
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
              _onAcept();
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
        data: (data) => SliverList.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return CardCarService(
                  vehicle: data[index] ,
                );
              },
            ),
        error: (error, stackTrace) =>
            SliverToBoxAdapter(child: Text(error.toString())),
        loading: () => Skeletonizer.sliver(
                child: SliverList.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return const Card(
                    child: SizedBox(
                  height: 150,
                  width: double.infinity,
                ));
              },
            )));
  }
}
