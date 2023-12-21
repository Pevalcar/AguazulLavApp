import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'action_card_menu.dart';

class MenuGridConten extends StatelessWidget {
  const MenuGridConten({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 80,// taaño de la tarjeta
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      children: [
        ActionCardMenu(
            title: "Agregar Servicio",
            icon: Icons.add,
            color: Theme.of(context).colorScheme.primary,
            onPressed: () {}),
        ActionCardMenu(
            title: "Modificar Servicio",
            icon: Icons.edit,
            color: Colors.red,
            onPressed: () {}),
        ActionCardMenu(
            title: "Lista de Servicios",
            icon: Icons.list_alt,
            color: Colors.red,
            onPressed: () {}),
        ActionCardMenu(
            title: "Historial de Servicios",
            icon: Icons.history,
            color: Colors.red,
            onPressed: () {}),
        ActionCardMenu(
            title: "Administrar Cuentas",
            icon: Icons.people_outlined,
            color: Colors.redAccent,
            onPressed: () {}),
        ActionCardMenu(
            title: "Configuracion",
            icon: Icons.settings,
            color: Colors.red,
            onPressed: () {}),
        ActionCardMenu(
            title: "Imprimir Factura",
            icon: Icons.print,
            color: Colors.red,
            onPressed: () {}),
        ActionCardMenu(
            title: "Clientes",
            icon: Icons.person_add_alt,
            color: Colors.red,
            onPressed: () {}),
            
        ActionCardMenu(
            title: "Correo",
            icon: Icons.mail,
            color: Colors.red,
            onPressed: () {}),
            
        ActionCardMenu(
            title: "Salir",
            icon: Icons.logout,
            color: Colors.red,
            onPressed: () {}),
            
      ],
    );
  }
}
