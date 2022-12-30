import 'package:coffee_order/database/models/table.dart';
import 'package:json_annotation/json_annotation.dart';

part 'table_list_response.g.dart';

@JsonSerializable()
class TableListResponse {
  final List<TableModel> items;

  TableListResponse(this.items);

  factory TableListResponse.fromJson(Map<String, dynamic> json) =>
      _$TableListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$TableListResponseToJson(this);
}
