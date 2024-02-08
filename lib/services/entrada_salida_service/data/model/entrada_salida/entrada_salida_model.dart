import 'package:aguazullavapp/lib.dart';
import 'package:hive/hive.dart';

part 'entrada_salida_model.g.dart';
@HiveType(typeId: 0)
class EntradaSalidaModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  DateTime? fecha;
  @HiveField(2)
  bool entrada;
  @HiveField(3)
  String concepto;
  @HiveField(4)
  int valor;

  EntradaSalidaModel(
      {required this.id,
      required this.fecha,
      required this.entrada,
      required this.concepto,
      required this.valor});

//combercion from entity to model
  factory EntradaSalidaModel.fromEntity(EntradaSalida entradaSalida) =>
      EntradaSalidaModel(
        id: entradaSalida.id,
        fecha: entradaSalida.fecha,
        entrada: entradaSalida.entrada,
        concepto: entradaSalida.concepto,
        valor: entradaSalida.valor,
      );

//conversion from model to entity
  EntradaSalida toEntity() => EntradaSalida(
        id: id,
        fecha: fecha,
        entrada: entrada,
        concepto: concepto,
        valor: valor,
      );
}
