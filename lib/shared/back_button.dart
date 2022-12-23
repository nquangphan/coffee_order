import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class NeumorphicBack extends StatelessWidget {
  const NeumorphicBack({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(12),
      style: const NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
      ),
      child: Icon(
        Icons.arrow_back,
        color: NeumorphicTheme.isUsingDark(context)
            ? Colors.white70
            : Colors.black87,
      ),
      onPressed: () {
        Get.back();
      },
    );
  }
}
