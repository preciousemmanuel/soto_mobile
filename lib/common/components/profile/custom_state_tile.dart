import 'package:soto_ecommerce/common/common.dart';

class CustomStateTile extends StatelessWidget {
  const CustomStateTile({
    super.key,
    required this.title,
    this.isSelected = false,
    this.onTap,
  });

  final String title;
  final bool isSelected;
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
          border: Border.all(
            color: AppColors.grayDE,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(Sizer.radius(6)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTypography.text14.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.primaryOrange,
                size: 20,
              )
          ],
        ),
      ),
    );
  }
}
