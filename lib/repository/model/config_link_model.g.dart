// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConfigLink _$GetConfigLinkFromJson(Map<String, dynamic> json) =>
    GetConfigLink(
      linkLogin: json['linkLogin'] as String?,
      linkRegist: json['linkRegist'] as String?,
      linkSupport: json['linkSupport'] as String?,
      mogame: json['mogame'] as String? ?? 'false',
    );

Map<String, dynamic> _$GetConfigLinkToJson(GetConfigLink instance) =>
    <String, dynamic>{
      'linkLogin': instance.linkLogin,
      'linkRegist': instance.linkRegist,
      'linkSupport': instance.linkSupport,
      'mogame': instance.mogame,
    };
