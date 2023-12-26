import 'package:aguazullavapp/lib.dart';
import 'package:aguazullavapp/model/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListProcess extends ConsumerWidget {
  final List<Vehicle> listServices;

  const ListProcess({super.key, required this.listServices});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("dibujando la lista");
    return ListView.builder(
        itemCount: listServices.length,
        itemBuilder: (context, index) {
          return CardCarService(
            vehicle: listServices[index]
          );
        });
  }
}
