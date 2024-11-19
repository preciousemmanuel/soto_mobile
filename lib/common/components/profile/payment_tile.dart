import 'package:soto_ecommerce/common/common.dart';

class PaymentTile extends StatelessWidget {
  const PaymentTile({
    super.key,
    this.isSelected = false,
    required this.title,
    required this.icon,
    this.onTap,
  });

  final bool isSelected;
  final String title;
  final String icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(10),
          vertical: Sizer.height(10),
        ),
        decoration: BoxDecoration(
            color: isSelected ? AppColors.black : AppColors.bgWhite,
            borderRadius: BorderRadius.circular(Sizer.radius(14)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ]),
        child: Row(
          children: [
            SizedBox(
              width: Sizer.width(40),
              height: Sizer.height(40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Sizer.radius(40)),
                child: svgHelper(icon),
              ),
            ),
            const XBox(16),
            Text(
              title,
              style: AppTypography.text14.copyWith(
                color: isSelected ? AppColors.white : AppColors.text12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            CustomCheckbox(
              onTap: onTap,
              isSelected: isSelected,
            ),
          ],
        ),
      ),
    );
  }
}
