// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderModelAdapter extends TypeAdapter<OrderModel> {
  @override
  final int typeId = 3;

  @override
  OrderModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderModel(
      totalPrice: fields[1] as int,
      details: (fields[0] as List).cast<OrderDetailModel>(),
      id: fields[2] as int,
      status: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, OrderModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.details)
      ..writeByte(1)
      ..write(obj.totalPrice)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      totalPrice: json['totalPrice'] as int,
      details: (json['details'] as List<dynamic>)
          .map((e) => OrderDetailModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['id'] as int? ?? -1,
      status: json['status'] as int? ?? 0,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'details': instance.details,
      'totalPrice': instance.totalPrice,
      'id': instance.id,
      'status': instance.status,
    };
