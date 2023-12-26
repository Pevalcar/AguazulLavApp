import 'package:aguazullavapp/lib.dart';
import 'package:flutter/material.dart';

class TypeCardSelectable extends StatelessWidget {
  const TypeCardSelectable({
    required this.listServices,
    required this.serviceSelection,
  });

  final List<ServiceInfo> listServices;
  final ServiceInfo? serviceSelection;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listServices
                .map((e) => TypeCardService(
                      typeCardService: e,
                      value:
                          (serviceSelection != null && serviceSelection == e),
                    ))
                .toList()),
      ),
    );
  }
}
