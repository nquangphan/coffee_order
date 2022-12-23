import 'package:coffee_order/database/models/table.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'order_detail.dart';

part 'order.g.dart';

@JsonSerializable()
@HiveType(typeId: 3)
class OrderModel extends HiveObject {
  static const hiveKey = 'ORDER_MODEL_KEY';

  @HiveField(0)
  List<OrderDetailModel> details;
  @HiveField(1)
  int totalPrice;
  @HiveField(2)
  int id;
  @HiveField(3)
  int status;
  @HiveField(4)
  TableModel table;
  OrderModel({
    required this.totalPrice,
    required this.details,
    required this.table,
    this.id = -1,
    this.status = 0,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderModelToJson(this);

  OrderModel merge({required OrderModel order}) {
    details = order.details;
    totalPrice = order.totalPrice;
    status = order.status;
    return this;
  }
}
