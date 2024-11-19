import 'package:soto_ecommerce/common/common.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        width: Sizer.width(38),
        height: Sizer.height(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.value ? AppColors.primaryOrange : Colors.grey,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              top: 0,
              bottom: 0,
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              left: widget.value ? 24 : 1,
              child: Container(
                padding: EdgeInsets.all(Sizer.radius(2)),
                width: Sizer.width(16),
                height: Sizer.height(16),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
