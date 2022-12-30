import 'package:coffee_order/shared/app_button.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class CommonBottomSheet extends StatelessWidget {
  const CommonBottomSheet(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              description,
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: AppButton(
                boxShape:
                    NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                onTap: Get.back,
                child: const Center(
                  child:
                      Text('OK', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ));
  }
}
