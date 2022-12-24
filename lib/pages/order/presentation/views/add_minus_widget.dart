import 'package:coffee_order/database/models/order_detail.dart';
import 'package:coffee_order/shared/app_container.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class AddMinusWidget extends StatefulWidget {
  const AddMinusWidget({
    super.key,
    required this.orderDetailModel,
    required this.onQuantityChange,
  });
  final OrderDetailModel? orderDetailModel;
  final Function(int) onQuantityChange;

  @override
  State<AddMinusWidget> createState() => _AddMinusWidgetState();
}

class _AddMinusWidgetState extends State<AddMinusWidget> {
  int currentQuantity = 0;
  @override
  void initState() {
    super.initState();
    currentQuantity = widget.orderDetailModel?.quantity ?? 0;
  }

  @override
  void didUpdateWidget(covariant AddMinusWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      currentQuantity = widget.orderDetailModel?.quantity ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (currentQuantity != 0)
          AppContainer(
            onTap: () {
              setState(() {
                currentQuantity = currentQuantity - 1;
                widget.onQuantityChange(currentQuantity);
              });
            },
            child: Icon(
              Icons.remove,
              color: Colors.amber[800],
            ),
          ),
        if (currentQuantity != 0)
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: AppContainer(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  currentQuantity.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        AppContainer(
          onTap: () {
            setState(() {
              currentQuantity = currentQuantity + 1;
              widget.onQuantityChange(currentQuantity);
            });
          },
          child: Icon(
            Icons.add,
            color: Colors.amber[800],
            size: 18,
          ),
        )
      ],
    );
  }
}
