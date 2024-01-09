import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListVehiculos extends ConsumerWidget {
  const ListVehiculos({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              SliverToBoxAdapter(
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: new Icon(Icons.photo),
                                  title: new Text('Photo'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: new Icon(Icons.music_note),
                                  title: new Text('Music'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: new Icon(Icons.videocam),
                                  title: new Text('Video'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: new Icon(Icons.share),
                                  title: new Text('Share'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Text('Mostrar Bottom Sheet'),
                  ),
                ),
              ),
              SliverAppBar(
                elevation: 10.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'Listado de Servicios',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  centerTitle: true,
                  collapseMode: CollapseMode.parallax,
                  titlePadding: const EdgeInsets.all(10.0),
                ),
                actions: const [DarkModeButton()],
                pinned: true,
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
