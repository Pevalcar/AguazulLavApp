import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ServiceTypeSelecte extends HookConsumerWidget {
  final String type;
  const ServiceTypeSelecte({
    super.key,
    required this.type,
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
    var filteredList = useState<List<ServiceType>>([]);
    final listServices = ref.watch(serviceTypeListProvider);
    // final serviceSelection = ref.watch(vehiculoStateProvider).servicios;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: listServices.when(
          data: (data) {
            filteredList.value = _sortList(data, type);
            return filteredList.value
                    .map((e) =>
                        ServiceTypeCard(typeCardService: e, value: false))
                    .toList();
          },
          error: (error, stackTrace) => [Text(error.toString())],
          loading: () => [const Center(child: CircularProgressIndicator())],
        ),
      ),
    );
  }
}
