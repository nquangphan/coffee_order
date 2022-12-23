import 'package:coffee_order/shared/app_container.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'back_button.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  static const double kToolbarHeight = 120;

  const TopBar({super.key, this.title = "", this.actions});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.all(12),
      child: AppContainer(
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Align(
                alignment: Alignment.centerLeft, child: NeumorphicBack()),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: NeumorphicTheme.isUsingDark(context)
                      ? Colors.white70
                      : Colors.black87,
                ),
              ),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions ?? [],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
