import 'package:soto_ecommerce/buyer/screens/confirmation/confirmation_screen.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/wallet_vm.dart';

class WithdrawToBankScreen extends StatefulWidget {
  const WithdrawToBankScreen({
    super.key,
    required this.args,
  });

  final WithdrawArgs args;

  @override
  State<WithdrawToBankScreen> createState() => _WithdrawToBankScreenState();
}

class _WithdrawToBankScreenState extends State<WithdrawToBankScreen> {
  TextEditingController amountC = TextEditingController();

  @override
  void dispose() {
    amountC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BusyOverlay(
      show: context.watch<WalletVm>().isBusy,
      child: Scaffold(
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
              CustomTextField(
                fillColor: AppColors.transparent,
                borderColor: AppColors.grayE0,
                labelText: "Enter Amount",
                showLabelHeader: true,
                hintText: 'N9,000',
                controller: amountC,
                keyboardType: KeyboardType.decimal,
                onChanged: (val) => setState(() {}),
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
              Consumer<AuthUserVM>(builder: (ctx, authVm, _) {
                return Container(
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
                              '${AppUtils.formatAmountString(
                                (authVm.wallet?.currentBalance ?? 0.0)
                                    .toString(),
                              )} NGN',
                              style: AppTypography.text16.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryOrange,
                              ),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          amountC.text =
                              authVm.wallet?.currentBalance.toString() ?? '';
                        },
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
                );
              }),
              const YBox(24),
              CustomBtn.solid(
                online: amountC.text.isNotEmpty,
                onTap: _withdrawToBank,
                text: "Continue",
              ),
              const YBox(50),
            ],
          ),
        ),
      ),
    );
  }

  void _withdrawToBank() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final vm = context.read<WalletVm>();
    final res = await vm.makeWithdrawal(
      amount: double.tryParse(amountC.text.replaceAllCommas()) ?? 0.0,
      bankId: widget.args.bankId,
    );
    handleApiResponse(
      response: res,
      onSuccess: () {
        Navigator.pushReplacementNamed(
          context,
          RoutePath.confirmationScreen,
          arguments: ConfirmationScreenArgs(
            msg: res.message ?? 'Withdrawal successful',
            onTap: () {
              pop();
              pop();
            },
          ),
        );
      },
    );
  }

  void pop() {
    Navigator.pop(NavKey.appNavigatorKey.currentContext!);
  }
}
