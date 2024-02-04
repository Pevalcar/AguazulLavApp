import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Formulario extends HookWidget {
  const Formulario({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final keyFrom = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.only(left: 32.0, right: 32.0),
      child: Form(
        key: keyFrom,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClientSearcher(),
            PlacaTextField(),
            TrabajadorNameField(),
          ],
        ),
      ),
    );
  }
}

class PlacaTextField extends HookConsumerWidget {
  const PlacaTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placa = ref.watch(placaProvider);
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialValue: placa,
      onChanged: (value) {
        ref.read(placaProvider.notifier).modifyPlaca(value);
      },
      decoration: const InputDecoration(
        labelText: "Placa",
        icon: Icon(Icons.numbers_rounded),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo requerido';
        } else if (!value.contains(RegExp(r'[0-9]'))) {
          if (!value.contains(RegExp(r'[A-Z]'))) {
            return 'Placa invalida';
          }
        } else if (value.length < 6) {
          return 'Placa invalida ';
          //value debe contener minimo una letra y minimo un numero
        }
        return null;
      },
    );
  }
}

class TrabajadorNameField extends HookConsumerWidget {
  const TrabajadorNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final worker = ref.watch(trabajadorNameProvider);
    return TextFormField(
      initialValue: worker,
      onChanged: (value) {
        ref.read(trabajadorNameProvider.notifier).modifyTrabajadorName(value);
      },
      decoration: const InputDecoration(
        labelText: "Trabajador",
        icon: Icon(Icons.emoji_people_rounded),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Campo requerido';
        }
        return null;
      },
    );
  }
}

class ClientSearcher extends HookConsumerWidget {
  const ClientSearcher({
    super.key,
  });
  static String _displayStringForOption(Client option) => option.name;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userOptions = ref.watch(clientListProvider);
    final client = ref.watch(propietarioProvider);
    return Row(
      children: [
        Flexible(
          child: Autocomplete(
            initialValue: TextEditingValue(
              text: client?.name ?? "",
            ),
            optionsViewBuilder: (context, onSelected, options) {
              return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 200),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          final Client option = options.elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              onSelected(option);
                            },
                            child: ListTile(
                              title: Text(
                                option.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text.rich(TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .outline
                                              .withOpacity(0.8)),
                                  text:
                                      'C.C: ${option.identification} | Telefono: ${option.phone} ')),
                            ),
                          );
                        },
                      ),
                    ),
                  ));
            },
            fieldViewBuilder:
                (context, textEditingController, focusNode, onEditingComplete) {
              return TextField(
                autofocus: true,
                controller: textEditingController,
                focusNode: focusNode,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person_search_outlined,
                  ),
                  labelText: 'Search for a client',
                  hintText: 'Search for a client',
                ),
                onSubmitted: (String value) {
                  onEditingComplete();
                },
              );
            },
            displayStringForOption: _displayStringForOption,
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<Client>.empty();
              }
              return userOptions.asData!.value.where((Client option) {
                return option
                    .toString()
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (Client selection) {
              ref
                  .read(propietarioProvider.notifier)
                  .modifyPropietario(selection);
            },
          ),
        ),
        const SizedBox(width: 8.0),
        IconButton(
          icon: const Icon(Icons.person_add_alt_1),
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return _AddClient(
                    onAddClient: (Client user) async {
                      ref.read(clientListProvider.notifier).addUSer(
                        user,
                        (us) {
                          showToast(context, "Cliente agregado");
                        },
                      );
                    },
                  );
                });
          },
        ),
      ],
    );
  }
}

class _AddClient extends HookWidget {
  final Function(Client) onAddClient;
  const _AddClient({required this.onAddClient});

  void supmited(
      BuildContext context,
      GlobalKey<FormState> keyForm,
      TextEditingController nameController,
      TextEditingController phoneController,
      TextEditingController idController) {
    keyForm.currentState!.save();
    if (keyForm.currentState!.validate()) {
      onAddClient(Client(
        name: nameController.text,
        phone: phoneController.text,
        identification: idController.text,
      ));
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final keyForm = GlobalKey<FormState>();
    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final idController = useTextEditingController();

    const spacer = SizedBox(height: 10);
    return AlertDialog(
      actions: [
        TextButton(
          child: const Text("Cancelar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
            child: const Text("Guardar"),
            onPressed: () {
              supmited(
                context,
                keyForm,
                nameController,
                phoneController,
                idController,
              );
            })
      ],
      scrollable: true,
      title: const Text("Añadir cliente"),
      content: Form(
        key: keyForm,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo requerido';
                }
                return null;
              },
              autofocus: true,
              controller: nameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Nombre',
              ),
            ),
            spacer,
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo requerido';
                }
                return null;
              },
              controller: phoneController,
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                labelText: 'Telefono',
              ),
              keyboardType: TextInputType.phone,
            ),
            spacer,
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Campo requerido';
                }
                return null;
              },
              controller: idController,
              decoration: const InputDecoration(
                icon: Icon(Icons.numbers),
                labelText: 'Identificacion',
              ),
              keyboardType: TextInputType.number,
              onFieldSubmitted: (value) {
                supmited(
                  context,
                  keyForm,
                  nameController,
                  phoneController,
                  idController,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
