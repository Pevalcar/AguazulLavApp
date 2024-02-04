// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrada_salida_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntradaSalidaModelAdapter extends TypeAdapter<EntradaSalidaModel> {
  @override
  final int typeId = 0;

  @override
  EntradaSalidaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EntradaSalidaModel(
      id: fields[0] as String,
      fecha: fields[1] as DateTime?,
      entrada: fields[2] as bool,
      concepto: fields[3] as String,
      valor: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, EntradaSalidaModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fecha)
      ..writeByte(2)
      ..write(obj.entrada)
      ..writeByte(3)
      ..write(obj.concepto)
      ..writeByte(4)
      ..write(obj.valor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntradaSalidaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
