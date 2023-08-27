import 'package:aguazullavapp/model/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'vehiculo_state_provider.g.dart';


@Riverpod(keepAlive: true)
class Vehiculo extends _$Vehiculo {
  @override
  Vehicle build() => const Vehicle();


  void ModifierVeichle(Vehicle vehiculo) {
    state = vehiculo;
  }
  void ModifiType(VeiculoType? type) {
    state = state.copyWith(type: type!);
  }
  
}