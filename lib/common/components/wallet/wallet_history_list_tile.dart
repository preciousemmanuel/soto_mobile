import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';

class WalletHistoryListTile extends StatelessWidget {
  const WalletHistoryListTile({
    super.key,
    this.isSend = false,
    required this.naration,
    required this.reference,
    required this.date,
    required this.amount,
  });

  final bool isSend;
  final String naration;
  final String reference;
  final String date;
  final String amount;

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
                naration,
                style: AppTypography.text14.copyWith(
                  color: AppColors.black33,
                ),
              ),
              const YBox(2),
              Text(
                reference,
                style: AppTypography.text12.copyWith(
                  color: AppColors.black66,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(amount)}',
                style: GoogleFonts.roboto(
                  color: isSend ? AppColors.red3B : AppColors.green78,
                  fontSize: Sizer.text(16),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YBox(2),
              Text(
                date,
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

class WithdrawRequestTile extends StatelessWidget {
  const WithdrawRequestTile({
    super.key,
    this.isSend = false,
    required this.naration,
    required this.date,
    required this.amount,
    this.status,
  });

  final bool isSend;
  final String naration;
  final String date;
  final String amount;
  final String? status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
        vertical: Sizer.height(6),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(Sizer.radius(10)),
            decoration: BoxDecoration(
              color: AppColors.red6C.withOpacity(0.2),
              borderRadius: BorderRadius.circular(
                Sizer.radius(30),
              ),
            ),
            child: svgHelper(
              AppSvgs.send,
              height: Sizer.height(14),
              width: Sizer.width(14),
            ),
          ),
          const XBox(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                naration,
                style: AppTypography.text14.copyWith(
                  color: AppColors.black33,
                ),
              ),
              const YBox(2),
              Text(
                '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(amount)}',
                style: GoogleFonts.roboto(
                  color: isSend ? AppColors.red3B : AppColors.green78,
                  fontSize: Sizer.text(12),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                status ?? 'Pending',
                style: GoogleFonts.roboto(
                  color: isSend ? AppColors.red3B : AppColors.green78,
                  fontSize: Sizer.text(14),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YBox(2),
              Text(
                date,
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
