import 'package:soto_ecommerce/common/common.dart';

class CartAmountTotal extends StatelessWidget {
  const CartAmountTotal({
    super.key,
    required this.total,
    required this.btnText,
    required this.btnOntap,
  });

  final String total;
  final String btnText;
  final void Function() btnOntap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
        vertical: Sizer.height(20),
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: AppColors.grayDE,
            width: Sizer.width(1),
          ),
          bottom: BorderSide(
            color: AppColors.grayDE,
            width: Sizer.width(1),
          ),
        ),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Total Amount',
                style: AppTypography.text14.copyWith(
                  color: AppColors.textAA,
                ),
              ),
              const YBox(4),
              Text(
                total,
                style: AppTypography.text20.copyWith(
                  fontFamily: '',
                  color: AppColors.primaryOrange,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          const XBox(14),
          Expanded(
            child: CustomBtn.solid(
              borderRadius: BorderRadius.circular(100),
              textStyle: AppTypography.text14.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
              onTap: btnOntap,
              text: btnText,
            ),
          ),
        ],
      ),
    );
  }
}
