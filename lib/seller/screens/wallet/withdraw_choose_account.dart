import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/wallet_vm.dart';

class WithdrawChooseAccount extends StatefulWidget {
  const WithdrawChooseAccount({super.key});

  @override
  State<WithdrawChooseAccount> createState() => _WithdrawChooseAccountState();
}

class _WithdrawChooseAccountState extends State<WithdrawChooseAccount> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WalletVm>().getMyBankDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletVm>(builder: (ctx, ref, _) {
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
              Expanded(
                child: ListView(
                  children: [
                    ref.isBusy
                        ? const SizerLoader(
                            height: 500,
                          )
                        : ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Sizer.radius(14)),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizer.width(14),
                                vertical: Sizer.height(14),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.orange71.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.circular(Sizer.radius(14)),
                              ),
                              child: ref.myBankDetails.isEmpty
                                  ? const EmptyListState(
                                      text: 'No bank details found')
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (ctx, i) {
                                        final bank = ref.myBankDetails[i];
                                        return AccountListTile(
                                          accountName: bank.accountName ?? '',
                                          accountNumber:
                                              bank.accountNumber ?? '',
                                          bankName: bank.bank?.name ?? '',
                                          onTap: () {
                                            Navigator.pushNamed(
                                              context,
                                              RoutePath.withdrawToBankScreen,
                                              arguments: WithdrawArgs(
                                                bank.id ?? '',
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      separatorBuilder: (_, __) =>
                                          const YBox(16),
                                      itemCount: ref.myBankDetails.length,
                                    ),
                            ),
                          ),
                  ],
                ),
              ),
              const YBox(40),
              CustomBtn.solid(
                onTap: () {
                  Navigator.pushNamed(
                      context, RoutePath.walletPaymentMethodScreen);
                },
                text: "Add bank account",
              ),
              const YBox(40),
            ],
          ),
        ),
      );
    });
  }
}
