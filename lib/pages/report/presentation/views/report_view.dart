import 'package:coffee_order/pages/report/presentation/views/seven_day_report_widget.dart';
import 'package:coffee_order/shared/app_button.dart';
import 'package:coffee_order/shared/app_container.dart';
import 'package:coffee_order/shared/app_textfield.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/report_controller.dart';

class ReportView extends GetView<ReportController> {
  const ReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: kToolbarHeight),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              AppContainer(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AppTextField(
                              hint: 'Server IP',
                              label: 'Server IP',
                              controller: controller.serverIPController,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: AppButton(
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12)),
                        onTap: controller.onSaveServerIPPressed,
                        child: const Center(
                          child: Text('Lưu',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              AppContainer(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Today\'s Revenue:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Text(
                          controller.todayRevenue.moneyFormat,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              const SizedBox(height: 24),
              const AppContainer(child: SevenDayReport()),
            ],
          ),
        ),
      ),
    );
  }
}

extension IntExt on int {
  String get moneyFormat {
    final oCcy = NumberFormat("#,##0", "en_US");
    return '${oCcy.format(this)} đ';
  }
}
