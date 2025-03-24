import 'package:soto_ecommerce/common/common.dart';

class DescTabDetail extends StatelessWidget {
  const DescTabDetail({
    super.key,
    this.desc,
  });

  final String? desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
      ),
      child: Text(
        desc ?? "No description available",
        style: AppTypography.text12.copyWith(
          color: AppColors.text57,
        ),
      ),
    );
  }
}
