// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableListResponse _$TableListResponseFromJson(Map<String, dynamic> json) =>
    TableListResponse(
      (json['items'] as List<dynamic>)
          .map((e) => TableModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TableListResponseToJson(TableListResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
