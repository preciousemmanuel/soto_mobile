import 'package:soto_ecommerce/common/common.dart';

class WithdrawChooseAccount extends StatelessWidget {
  const WithdrawChooseAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: CustomHeader(
        title: 'Withdraw to bank',
        titleWeight: FontWeight.w500,
        titleStyle: AppTypography.text16.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.text12,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const YBox(20),
            Text('Choose Account', style: AppTypography.text16),
            const YBox(12),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(14),
                vertical: Sizer.height(14),
              ),
              decoration: BoxDecoration(
                color: AppColors.orange71.withOpacity(0.1),
                borderRadius: BorderRadius.circular(Sizer.radius(14)),
              ),
              child: const Column(
                children: [
                  AccountListTile(
                    accountName: 'Precious Ruchi',
                    accountNumber: '0736623718',
                    bankName: 'Microfinance Bank',
                  ),
                  YBox(20),
                  AccountListTile(
                    accountName: 'Precious Ruchi',
                    accountNumber: '0736623718',
                    bankName: 'Microfinance Bank',
                  ),
                ],
              ),
            ),
            const Spacer(),
            const YBox(24),
            CustomBtn.solid(
              onTap: () {
                Navigator.pushNamed(
                    context, RoutePath.walletPaymentMethodScreen);
              },
              text: "Add bank account",
            ),
            const YBox(50),
          ],
        ),
      ),
    );
  }
}
