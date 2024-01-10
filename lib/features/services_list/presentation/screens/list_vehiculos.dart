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
                        SizedBox(
                          width: 300.0,
                          child: TextFormField(
                            readOnly: !_iniciatejornada.value,
                            autofocus: true,
                            autovalidateMode:  AutovalidateMode.onUserInteraction,
                            controller: _cajainicialController,
                            decoration: const InputDecoration(
                              hintText: "Caja inicial",
                              labelText: 'Caja base',
                              icon: Icon(Icons.numbers),
                              border: UnderlineInputBorder(),
                              helperText: "Caja base",
                            ),
                            onChanged: (value) {},
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Agregar un valor";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            onFieldSubmitted: (value) {},
                            textInputAction: TextInputAction.done,
                          
                          ),
                        ),
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
