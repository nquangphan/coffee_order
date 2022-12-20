import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      padding: const EdgeInsets.all(12),
      style: NeumorphicStyle(
          shape: NeumorphicShape.concave,
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
          depth: 10,
          lightSource: LightSource.topLeft,
          color: Colors.white,
          intensity: 0.5,
          surfaceIntensity: 0),
      child: child,
    );
  }
}
