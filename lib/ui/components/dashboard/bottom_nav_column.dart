// ignore_for_file: deprecated_member_use

import 'package:flutter_svg/svg.dart';
import 'package:soto_ecommerce/core/core.dart';

class BottomNavColumn extends StatelessWidget {
  const BottomNavColumn({
    super.key,
    required this.icon,
    required this.labelText,
    this.showIcon = true,
    this.isActive = false,
    required this.onPressed,
  });

  final dynamic icon;
  final String labelText;
  final bool showIcon;
  final bool isActive;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          (icon is String)
              ? SvgPicture.asset(
                  icon,
                  color: isActive ? AppColors.primaryOrange : AppColors.textAA,
                  height: Sizer.height(25),
                  width: Sizer.width(25),
                )
              : Icon(
                  icon,
                  color: isActive ? AppColors.primaryOrange : AppColors.textAA,
                  size: Sizer.height(25),
                ),
          Container(
            padding: EdgeInsets.only(
              top: !showIcon ? Sizer.height(20) : 0,
            ),
            child: Text(
              labelText,
              style: AppTypography.text12.copyWith(
                color: isActive ? AppColors.primaryOrange : AppColors.textAA,
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
