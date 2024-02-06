import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

//TODO implementar PC soport
class AdminClientScreenPage extends StatelessWidget {
  const AdminClientScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.help)),
          const DarkModeButton()
        ],
        title: const Text('Clientes'),
        centerTitle: true,
      ),
      body: const MobileContenido(),
      floatingActionButton: const AddClient(),
    );
  }
}

class AddClient extends HookConsumerWidget {
  final Client? client;
  const AddClient({
    super.key,
    this.client,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => DialogClientInfo(
            client: client,
            onAddClient: (cliente) {
              ref.read(clientListProvider.notifier).addClient(
                    cliente,
                    null,
                  );
            },
          ),
        );
      },
      child: const Icon(Icons.person_add),
    );
  }
}

class DialogClientInfo extends StatelessWidget {
  const DialogClientInfo({
    super.key,
    Client? client,
    required this.onAddClient,
  }) : _client = client;

  final Client? _client;
  final Function(Client) onAddClient;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final identificationController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();
    final addressController = TextEditingController();
    final cityController = TextEditingController();
    final departmentController = TextEditingController();
    if (_client != null) {
      nameController.text = _client!.name;
      identificationController.text = _client!.identification;
      phoneController.text = _client!.phone;
      emailController.text = _client!.email;
      addressController.text = _client!.address;
      cityController.text = _client!.city;
      departmentController.text = _client!.departamento;
    }
    return AlertDialog(
      scrollable: true,
      actions: [
        TextButton(
          child: const Text("Cancelar"),
          onPressed: () => Navigator.of(context).pop(),
        ),
        TextButton(
          child: Text(_client == null ? "Guardar" : "Editar"),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              onAddClient(Client(
                id: _client?.id ?? "",
                name: nameController.text,
                identification: identificationController.text,
                phone: phoneController.text,
                email: emailController.text,
                address: addressController.text,
                city: cityController.text,
                departamento: departmentController.text,
              ));
              Navigator.of(context).pop();
            }
          },
        ),
      ],
      title: Center(
        child: Text(
          _client == null ? "Añadir cliente" : "Editar cliente",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: formKey,
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      label: Text("Nombre"),
                      hintText: "Nombre del cliente",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un nombre';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: identificationController,
                    decoration: const InputDecoration(
                      label: Text("Identificación"),
                      hintText: "Identificación del cliente",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa una identificación';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: phoneController,
                    decoration: const InputDecoration(
                      label: Text("Teléfono"),
                      hintText: "Teléfono del cliente",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un teléfono';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      label: Text("Correo"),
                      hintText: "Correo del cliente",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un correo';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: addressController,
                    decoration: const InputDecoration(
                      label: Text("Dirección"),
                      hintText: "Dirección del cliente",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un dirección';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      label: Text("Ciudad"),
                      hintText: "Ciudad del cliente",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un ciudad';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: departmentController,
                    decoration: const InputDecoration(
                      label: Text("Departamento"),
                      hintText: "Departamento del cliente",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor ingresa un departamento';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FormTextFliedClient extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final String? initialValue;
  const FormTextFliedClient({
    super.key,
    required this.title,
    required this.controller,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField();
  }
}

class MobileContenido extends HookConsumerWidget {
  const MobileContenido({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _clients = ref.watch(clientListProvider);
    return _clients.when(
      data: (data) {
        return SafeArea(
          child: RefreshIndicator(
              onRefresh: () {
                ref.read(clientListProvider.notifier).fetch();
                return Future.delayed(const Duration(seconds: 1));},
              child: ListaClientes(clientes: data)),
        );
      },
      error: (error, stack) => Text(error.toString()),
      loading: () => const LoadingList(),
    );
  }
}

class LoadingList extends StatelessWidget {
  const LoadingList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Text("Cargando..."),
            subtitle: Text("Cargando..."),
          );
        },
      ),
    );
  }
}

class ListaClientes extends StatelessWidget {
  final List<Client> _clientes;
  const ListaClientes({
    super.key,
    required List<Client> clientes,
  }) : _clientes = clientes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: _clientes.length,
      itemBuilder: (context, index) {
        return ClientCard(
          client: _clientes[index],
        );
      },
    );
  }
}

class ClientCard extends HookConsumerWidget {
  final Client _cliente;
  const ClientCard({
    super.key,
    required Client client,
  }) : _cliente = client;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ExpansionTile(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          collapsedShape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.outline,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text(
            _cliente.name,
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text(_cliente.identification),
          children: [
            Text("Información",
                style: const TextStyle(fontSize: 20)
                    .copyWith(fontWeight: FontWeight.bold)),
            Text("Identificación: ${_cliente.address}"),
            Text("Teléfono: ${_cliente.phone}"),
            Text("Correo: ${_cliente.email}"),
            Text("Dirección: ${_cliente.address} "),
            Text("Ciudad: ${_cliente.city}"),
            Text("Departamento: ${_cliente.departamento}"),
            Text("Lavados: ${_cliente.bonus}"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceAround,
                buttonHeight: 52.0,
                buttonMinWidth: 90.0,
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => DialogClientInfo(
                                client: _cliente,
                                onAddClient: (client) {
                                  ref
                                      .read(clientListProvider.notifier)
                                      .modifieUSer(client, null);
                                },
                              ));
                    },
                    child: const Icon(Icons.edit),
                  ),
                  const SizedBox(width: 10),
                  PinAccess(
                    correctPin: ref.watch(pinPassProvider).asData?.value ?? 0,
                    correctPass: () {
                      ref
                          .read(clientListProvider.notifier)
                          .deleteUSer(_cliente);
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
