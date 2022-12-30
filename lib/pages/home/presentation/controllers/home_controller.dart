import 'package:coffee_order/api/app_api.dart';
import 'package:coffee_order/pages/table_detail/presentation/views/table_detail_view.dart';
import 'package:coffee_order/repository/table_repository.dart';
import 'package:coffee_order/shared/app_button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../database/hive_database.dart';
import '../../../../database/models/table.dart';

class HomeController extends GetxController {
  RxList<TableModel> tableList = <TableModel>[].obs;
  HomeController({
    required this.tableRepository,
  });

  final TableRepository tableRepository;

  final AppApi appAPI = Get.find();

  @override
  void onInit() {
    super.onInit();
    getTableList();
  }

  configAppStoreVersion() {
    appAPI.getAppConfigData().then((config) {
      if (config.mogame == 'true') {
        Get.bottomSheet(
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                Image.asset('assets/app_back_drop.png'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        child: const Center(
                          child: Text('Hỗ trợ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        onTap: () {
                          launchUrl(Uri.parse(config.linkSupport ?? ''),
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppButton(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        child: const Center(
                          child: Text('Đăng kí',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        onTap: () {
                          launchUrl(Uri.parse(config.linkRegist ?? ''),
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: AppButton(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        child: const Center(
                          child: Text('Đăng nhập',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        onTap: () {
                          launchUrl(Uri.parse(config.linkLogin ?? ''),
                              mode: LaunchMode.externalApplication);
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }
    });
  }

  Future<void> getTableList() async {
    tableList.value = await tableRepository.getTable();
    tableList.refresh();
  }

  onTablePressed(TableModel table) async {
    await Get.toNamed(TableDetailView.routeName, arguments: table);
    getTableList();
  }
}
