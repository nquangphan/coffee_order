import 'package:coffee_order/pages/menu_detail/bindings/menu_detail_binding.dart';
import 'package:coffee_order/pages/menu_detail/presentation/views/menu_detail_view.dart';
import 'package:coffee_order/pages/order/bindings/order_binding.dart';
import 'package:coffee_order/pages/order/presentation/views/order_view.dart';
import 'package:coffee_order/pages/table_detail/bindings/table_detail_binding.dart';
import 'package:coffee_order/pages/table_detail/presentation/views/table_detail_view.dart';
import 'package:get/get.dart';

import '../pages/dashboard/bindings/dashboard_binding.dart';
import '../pages/dashboard/presentation/views/dashboard_view.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = DashboardView.routeName;

  static final routes = [
    GetPage(
      name: DashboardView.routeName,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: MenuDetailView.routeName,
      page: () => const MenuDetailView(),
      binding: MenuDetailBinding(),
    ),
    GetPage(
      name: TableDetailView.routeName,
      page: () => const TableDetailView(),
      binding: TableDetailBinding(),
    ),
    GetPage(
      name: OrderView.routeName,
      page: () => const OrderView(),
      binding: OrderBinding(),
    ),
  ];
}
