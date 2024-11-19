import 'package:soto_ecommerce/common/common.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppColors.dividerColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizer.width(10)),
          child: Text(
            "Or",
            textAlign: TextAlign.center,
            style: AppTypography.text14.copyWith(
              color: AppColors.text26,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppColors.dividerColor,
          ),
        ),
      ],
    );
  }
}
