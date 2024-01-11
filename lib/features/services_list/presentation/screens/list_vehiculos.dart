import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListVehiculos extends HookConsumerWidget {
  const ListVehiculos({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _iniciatejornada = useState(true);
    final _cajainicialController = useTextEditingController();
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
                pinned: true,
                elevation: 10.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Listado de Servicios',
                      style: Theme.of(context).textTheme.titleLarge),
                  background: Center(
                    child: SizedBox(
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _iniciatejornada.value = !_iniciatejornada.value;
                            },
                            child: Text(_iniciatejornada.value
                                ? "Iniciar Jornada"
                                : "Finalizar Jornada"),
                          ),
                          TextToTextFieldIniciaBase(
                              iniciatejornada: _iniciatejornada,
                              cajainicialController: _cajainicialController),
                          Row(
                            children: [
                              Text(
                                'Listado de Servicios',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                'Listado de Servicios',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          Text(
                            'Listado de Servicios',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  titlePadding: const EdgeInsets.all(10.0),
                ),
                expandedHeight: MediaQuery.of(context).size.height * 0.5,
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

class TextToTextFieldIniciaBase extends StatelessWidget {
  const TextToTextFieldIniciaBase({
    super.key,
    required ValueNotifier<bool> iniciatejornada,
    required TextEditingController cajainicialController,
  })  : _iniciatejornada = iniciatejornada,
        _cajainicialController = cajainicialController;

  final ValueNotifier<bool> _iniciatejornada;
  final TextEditingController _cajainicialController;

  @override
  Widget build(BuildContext context) {
    return !_iniciatejornada.value
        ? Text("Caja inicial ..... \$ ${_cajainicialController.text}")
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
            onFieldSubmitted: (value) {
              showDialog(context : context, builder: (_) {
                return AlertDialog(
                  
                  title: const Text("¿Seguro que desea iniciar jornada?"),
                  content: Text("Caja inicial: \$ ${_cajainicialController.text}"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancelar"),

                    ),
                    TextButton(
                      onPressed: () {
              _iniciatejornada.value = !_iniciatejornada.value;
                        //TODO Agregar la jurnada para base de datos de jornadas
                        Navigator.of(context).pop();
                      },
                      child: const Text("Iniciar"),
                    )
                  ]
                );
              },
              );
            },
            textInputAction: TextInputAction.done,
          );
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
                  vehicle: data[index],
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
