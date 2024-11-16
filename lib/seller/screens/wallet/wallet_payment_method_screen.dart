import 'package:soto_ecommerce/common/common.dart';

class WalletPaymentMethodScreen extends StatelessWidget {
  const WalletPaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: CustomHeader(
        title: 'Payment Method',
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
              labelText: "Account number",
              showLabelHeader: true,
              hintText: 'Enter account number',
              // controller: vm.productNameC,
              // onChanged: (val) => vm.reBuildUI(),
            ),
            const YBox(20),
            const CustomTextField(
              fillColor: AppColors.transparent,
              borderColor: AppColors.grayE0,
              labelText: "Bank Name",
              showLabelHeader: true,
              hintText: 'Select bank',
              showSuffixIcon: true,
              suffixIcon: Icon(
                Icons.keyboard_arrow_down,
              ),
              // controller: vm.productNameC,
              // onChanged: (val) => vm.reBuildUI(),
            ),
            const Spacer(),
            CustomBtn.solid(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePath.withdrawChooseAccount,
                );
              },
              text: "Proceed",
            ),
            const YBox(50),
          ],
        ),
      ),
    );
  }
}
