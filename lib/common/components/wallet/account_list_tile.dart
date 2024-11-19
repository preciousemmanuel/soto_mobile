import 'package:soto_ecommerce/common/common.dart';

class AccountListTile extends StatelessWidget {
  const AccountListTile({
    super.key,
    required this.accountName,
    required this.accountNumber,
    required this.bankName,
  });

  final String accountName;
  final String accountNumber;
  final String bankName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: Sizer.width(40),
          height: Sizer.height(40),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Sizer.radius(40)),
            child: imageHelper(AppImages.moniePoint),
          ),
        ),
        const XBox(10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              accountName,
              style: AppTypography.text16.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const YBox(2),
            Text(
              accountNumber,
              style: AppTypography.text12.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.text66,
              ),
            ),
            const YBox(2),
            Text(
              bankName,
              style: AppTypography.text12.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.text66,
              ),
            ),
          ],
        )
      ],
    );
  }
}
