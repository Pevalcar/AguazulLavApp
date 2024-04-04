import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesktopAddService extends HookConsumerWidget {
  const DesktopAddService({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final typeService = ref.watch(typoDeVehiculoProvider);

//on back pressed delete photo
    return PopScope(
      canPop: false,
      onPopInvoked: (_) async {
        ref.read(photoVehiculeProvider.notifier).deletePhoto(
            ref.watch(photoVehiculeProvider).asData?.value?.photoName,
            () => context.pop());
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Información del vehiculo'),
            actions: const [DarkModeButton()],
          ),
          body: SingleChildScrollView(
            // ignore: prefer_const_constructors
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const Formulario(isDesktop: true),
              const SizedBox(height: 16),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Flexible(
                    child: Handled(),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        DropDownTypeVehicle(
                          typesList: ref.watch(typosDeVeiculosProvider),
                          type: typeService,
                        ),
                        _ServiceTypeSelecte(type: typeService),
                        const TimerDataShow(),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
            ]),
          ),
          floatingActionButton:
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            FloatingActionButton(
              onPressed: () {
                ref.watch(vehiculoStateProvider);
                ref.read(vehiculoStateProvider.notifier).addVehiculo(
                  () {
                    showToast(context, "Agreagado con Exito");
                    context.pop();
                  },
                  (errorMesage) {
                    showToast(context, errorMesage);
                  },
                );
              },
              child: const Row(
                children: [
                  Icon(Icons.add),
                  Icon(Icons.room_service_sharp),
                ],
              ),
            ),
          ])),
    );
  }
}

class _ServiceTypeSelecte extends HookConsumerWidget {
  final String type;
  const _ServiceTypeSelecte({
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
    final serviceSelection = ref.watch(serviceTypeSelectProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: listServices.when(
        data: (data) {
          filteredList.value = _sortList(data, type);
          return filteredList.value
              .map((e) => _ServiceTypeCard(
                  typeCardService: e, value: serviceSelection == e))
              .toList();
        },
        error: (error, stackTrace) => [Text(error.toString())],
        loading: () => [const Center(child: CircularProgressIndicator())],
      ),
    );
  }
}

class _ServiceTypeCard extends ConsumerWidget {
  final ServiceType typeCardService;
  final bool value;

  const _ServiceTypeCard({
    super.key,
    required this.typeCardService,
    required this.value,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
        shadowColor: value ? Colors.blue[200] : null,
        color: value ? Theme.of(context).colorScheme.secondaryContainer : null,
        elevation: 4.0,
        child: CheckboxListTile(
          activeColor: Theme.of(context).colorScheme.primary,
          controlAffinity: ListTileControlAffinity.leading,
          title: RichText(
              textAlign: TextAlign.center,
              softWrap: false,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "${typeCardService.typeVehiculo} ",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: typeCardService.price,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.5)),
                        ),
                      ]),
                ],
              )),
          value: value,
          onChanged: (value) => ref
              .read(serviceTypeSelectProvider.notifier)
              .modifyServiceType(typeCardService),
        ));
  }
}
