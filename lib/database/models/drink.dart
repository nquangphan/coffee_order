import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drink.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class DrinkModel extends HiveObject {
  static const hiveKey = 'DRINK_MODEL_KEY';

  @HiveField(0)
  String name;
  @HiveField(1)
  int price;
  @HiveField(2)
  String image;
  @HiveField(3)
  int id;
  DrinkModel({
    required this.name,
    required this.price,
    required this.image,
    this.id = -1,
  });

  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);
  Map<String, dynamic> toJson() => _$DrinkModelToJson(this);

  DrinkModel merge({required DrinkModel drink}) {
    name = drink.name;
    price = drink.price;
    image = drink.image;
    return this;
  }
}
