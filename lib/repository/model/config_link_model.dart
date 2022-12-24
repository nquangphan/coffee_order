import 'package:json_annotation/json_annotation.dart';
part 'config_link_model.g.dart';

@JsonSerializable()
class GetConfigLink {
  GetConfigLink({
    this.linkLogin,
    this.linkRegist,
    this.linkSupport,
    this.mogame = 'false',
  });

  String? linkLogin;
  String? linkRegist;
  String? linkSupport;
  String? mogame;

  factory GetConfigLink.fromJson(Map<String, dynamic> json) =>
      _$GetConfigLinkFromJson(json);
  Map<String, dynamic> toJson() => _$GetConfigLinkToJson(this);
}
