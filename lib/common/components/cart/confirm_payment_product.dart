import 'package:soto_ecommerce/common/common.dart';

class ConfirmPaymentProduct extends StatelessWidget {
  const ConfirmPaymentProduct({
    super.key,
    this.image,
    required this.name,
    this.onTap,
  });

  final String? image;
  final String name;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Sizer.width(84),
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(Sizer.radius(8)),
              child: MyCachedNetworkImage(
                imageUrl: image,
                fadeInDuration: const Duration(milliseconds: 50),
                fit: BoxFit.cover,
                height: Sizer.height(84),
                width: Sizer.width(84),
              ),
            ),
            const YBox(2),
            Container(
              // color: AppColors.red,
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(1),
              ),
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.text10.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
