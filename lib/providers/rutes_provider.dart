import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/rute/rutes.dart';

part 'rutes_provider.g.dart';

@riverpod
Rutas getRutas(GetRutasRef ref) {
  return Rutas.AddService();
}
