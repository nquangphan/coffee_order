import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'table.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class TableModel extends HiveObject {
  static const hiveKey = 'TABLE_MODEL_KEY';

  @HiveField(0)
  String name;
  @HiveField(1)
  int id;
  @HiveField(2)
  int status;
  TableModel({
    required this.name,
    this.id = -1,
    this.status = 0,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) =>
      _$TableModelFromJson(json);
  Map<String, dynamic> toJson() => _$TableModelToJson(this);

  TableModel merge({required TableModel table}) {
    name = table.name;
    status = table.status;
    return this;
  }
}
