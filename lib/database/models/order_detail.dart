import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'drink.dart';

part 'order_detail.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class OrderDetailModel extends HiveObject {
  static const hiveKey = 'ORDER_DETAIL_MODEL_KEY';

  @HiveField(0)
  int quantity;
  @HiveField(1)
  DrinkModel drink;
  @HiveField(2)
  int id;
  @HiveField(3)
  int status;
  OrderDetailModel({
    required this.quantity,
    required this.drink,
    this.id = -1,
    this.status = 0,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$OrderDetailModelToJson(this);

  OrderDetailModel merge({required OrderDetailModel orderDetail}) {
    quantity = orderDetail.quantity;
    drink = orderDetail.drink;
    status = orderDetail.status;
    return this;
  }
}
