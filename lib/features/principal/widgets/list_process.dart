import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListProcess extends ConsumerWidget {
  const ListProcess({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listServices = ref.watch(serviceListProvider);
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        primary: true,
        slivers: [
          SliverAppBar(
            elevation: 10.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Listado de Servicios',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              centerTitle: true,
              collapseMode: CollapseMode.parallax,
              titlePadding: EdgeInsets.all(10.0),
            ),
            actions: [DarkModeButton()],
            pinned: true,
          ),
          listServices.when(
            data: (data) {
              return SliverList.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return CardCarService(
                    vehicle: data[index],
                  );
                },
              );
            },
            error: (error, stackTrace) =>
                SliverToBoxAdapter(child: Text(error.toString())),
            loading: () =>
                const SliverToBoxAdapter(child: CircularProgressIndicator()),
          )
        ],
      ),
    );
  }
}
