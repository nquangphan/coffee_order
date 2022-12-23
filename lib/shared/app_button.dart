import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.child, required this.onTap});
  final Widget child;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(12),
      style: const NeumorphicStyle(
        boxShape: NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
