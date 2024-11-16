import 'package:soto_ecommerce/common/common.dart';

class WithdrawToBankScreen extends StatelessWidget {
  const WithdrawToBankScreen({super.key});

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
          children: [
            const YBox(50),
            const CustomTextField(
              fillColor: AppColors.transparent,
              borderColor: AppColors.grayE0,
              labelText: "Enter Amount",
              showLabelHeader: true,
              hintText: 'N9,000',
              // controller: vm.productNameC,
              // onChanged: (val) => vm.reBuildUI(),
            ),
            const YBox(4),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Charges: 900',
                style: AppTypography.text12.copyWith(
                  color: AppColors.text66,
                ),
              ),
            ),
            const YBox(60),
            Text(
              'The above amount will be deducted from your \nwallet with 10% charges automatically applied',
              textAlign: TextAlign.center,
              style: AppTypography.text12.copyWith(color: AppColors.text66),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(16),
                vertical: Sizer.height(10),
              ),
              decoration: BoxDecoration(
                color: AppColors.orangeE3,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bal:',
                          style: AppTypography.text14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.text5C,
                          ),
                        ),
                        const YBox(4),
                        Text(
                          'N34,123',
                          style: AppTypography.text16.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryOrange,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizer.width(16),
                        vertical: Sizer.height(8),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Use Max',
                        style: AppTypography.text12.copyWith(
                          color: AppColors.primaryOrange,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const YBox(24),
            CustomBtn.solid(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePath.withdrawChooseAccount,
                );
              },
              text: "Continue",
            ),
            const YBox(50),
          ],
        ),
      ),
    );
  }
}
