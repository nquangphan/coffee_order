import 'package:coffee_order/database/models/drink.dart';
import 'package:coffee_order/database/models/order.dart';
import 'package:coffee_order/repository/model/config_link_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'app_api.g.dart';

@RestApi()
abstract class AppApi {
  factory AppApi(Dio dio, {String baseUrl}) = _AppApi;

  @GET('/link')
  Future<GetConfigLink> getAppConfigData();
  @GET('/table')
  Future<String> getListTable();

  @GET('/drink')
  Future<String> getMenu();
  @POST('/drink')
  Future<String> addMenu(@Body() DrinkModel drinkModel);
  @PUT('/drink')
  Future<String> updateMenu(@Body() DrinkModel drinkModel);

  @GET('/order/{status}')
  Future<String> getOrderByStatus(@Path() String status);
  @POST('/order')
  Future<String> createOrder(@Body() OrderModel orderModel);
  @PUT('/order')
  Future<String> updateOrder(@Body() OrderModel orderModel);

  @GET('/orderByTableId/{tableID}')
  Future<String> getOrderByTableID(@Path() String tableID);

  @GET('/orderByTimeStamp/{timeStamp}')
  Future<String> getOrderByTimeStamp(@Path() String timeStamp);

  @GET('/orderByMonth/{timeStamp}')
  Future<String> getOrderByMonth(@Path() String timeStamp);
}
