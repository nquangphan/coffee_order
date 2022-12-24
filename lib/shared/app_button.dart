import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key, required this.child, required this.onTap, this.boxShape});
  final Widget child;
  final Function() onTap;
  final NeumorphicBoxShape? boxShape;
  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      padding: const EdgeInsets.all(12),
      style: NeumorphicStyle(
        boxShape: boxShape ?? const NeumorphicBoxShape.circle(),
        shape: NeumorphicShape.flat,
      ),
      onPressed: onTap,
      child: child,
    );
  }
}
