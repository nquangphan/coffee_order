import 'package:coffee_order/repository/model/config_link_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi(
  baseUrl: 'http://changelink.click/api/',
)
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @GET('/link')
  Future<GetConfigLink> getAppConfigData();
}
