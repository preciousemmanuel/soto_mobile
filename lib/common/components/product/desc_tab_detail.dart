import 'package:soto_ecommerce/common/common.dart';

class DescTabDetail extends StatelessWidget {
  const DescTabDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
      ),
      child: Text(
        "I recently purchased the Avery Sofa and Armchair from E&M Furnitures, and I couldn't be happier! The quality of the materials and craftsmanship is top-notch and the delivery team was professional, ensuring everything was perfectly assembled.",
        style: AppTypography.text12.copyWith(
          color: AppColors.text57,
        ),
      ),
    );
  }
}
