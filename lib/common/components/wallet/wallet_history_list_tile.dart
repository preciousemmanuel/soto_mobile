import 'package:soto_ecommerce/common/common.dart';

class WalletHistoryListTile extends StatelessWidget {
  const WalletHistoryListTile({
    super.key,
    this.isSend = false,
  });

  final bool isSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
        vertical: Sizer.height(4),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(Sizer.radius(10)),
            decoration: BoxDecoration(
              color:
                  isSend ? AppColors.red6C.withOpacity(0.2) : AppColors.greenE9,
              borderRadius: BorderRadius.circular(
                Sizer.radius(30),
              ),
            ),
            child: svgHelper(isSend ? AppSvgs.send : AppSvgs.receive),
          ),
          const XBox(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Payment',
                style: AppTypography.text14.copyWith(
                  color: AppColors.black33,
                ),
              ),
              const YBox(2),
              Text(
                '#212323',
                style: AppTypography.text14.copyWith(
                  color: AppColors.black66,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'N50,000',
                style: AppTypography.text15.copyWith(
                  color: isSend ? AppColors.red3B : AppColors.green78,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YBox(2),
              Text(
                'October 25th, 2024',
                style: AppTypography.text12.copyWith(
                  color: AppColors.black66,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
