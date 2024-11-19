import 'package:dotted_border/dotted_border.dart';
import 'package:soto_ecommerce/common/common.dart';

class PaymentAddCard extends StatelessWidget {
  const PaymentAddCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutePath.addCardScreen);
      },
      child: DottedBorder(
        dashPattern: const [8, 5],
        strokeWidth: 2,
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        color: AppColors.grayCC,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(16),
            vertical: Sizer.height(12),
          ),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(Sizer.radius(12)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(Sizer.radius(4)),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.grayD9,
                    )),
                child: const Icon(
                  Iconsax.add,
                ),
              ),
              const XBox(18),
              Text(
                'Add card',
                style: AppTypography.text14.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
