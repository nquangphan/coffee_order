import 'package:get/get.dart';

import '../pages/dashboard/bindings/dashboard_binding.dart';
import '../pages/dashboard/presentation/views/dashboard_view.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
  ];
}
