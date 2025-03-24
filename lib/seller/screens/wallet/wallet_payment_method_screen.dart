import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class WalletPaymentMethodScreen extends StatefulWidget {
  const WalletPaymentMethodScreen({super.key});

  @override
  State<WalletPaymentMethodScreen> createState() =>
      _WalletPaymentMethodScreenState();
}

class _WalletPaymentMethodScreenState extends State<WalletPaymentMethodScreen> {
  TextEditingController accountNumberC = TextEditingController();
  TextEditingController bankC = TextEditingController();
  FocusNode accountNumberF = FocusNode();
  FocusNode bankF = FocusNode();

  Bank? selectedBank;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    accountNumberC.dispose();
    bankC.dispose();
    accountNumberF.dispose();
    bankF.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletVm>(builder: (ctx, vm, _) {
      return BusyOverlay(
        show: vm.isBusy,
        child: Scaffold(
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
                CustomTextField(
                  focusNode: accountNumberF,
                  controller: accountNumberC,
                  fillColor: AppColors.transparent,
                  borderColor: AppColors.grayE0,
                  labelText: "Account number",
                  showLabelHeader: true,
                  hintText: 'Enter account number',
                  onChanged: (val) => vm.reBuildUI(),
                ),
                const YBox(20),
                CustomTextField(
                  focusNode: bankF,
                  controller: bankC,
                  fillColor: AppColors.transparent,
                  borderColor: AppColors.grayE0,
                  labelText: "Bank Name",
                  showLabelHeader: true,
                  hintText: 'Select bank',
                  showSuffixIcon: true,
                  isReadOnly: true,
                  onChanged: (val) => vm.reBuildUI(),
                  suffixIcon: const Icon(
                    Icons.keyboard_arrow_down,
                  ),
                  onTap: () async {
                    final Bank? res = await ModalWrapper.bottomSheet(
                      context: context,
                      widget: const SelectBankSheet(),
                    );

                    if (res != null) {
                      selectedBank = res;
                      bankC.text = res.name ?? "";
                    }
                  },
                ),
                const Spacer(),
                CustomBtn.solid(
                  online:
                      selectedBank != null && accountNumberC.text.isNotEmpty,
                  onTap: _addBankDetails,
                  text: "Proceed",
                ),
                const YBox(50),
              ],
            ),
          ),
        ),
      );
    });
  }

  void _addBankDetails() async {
    FocusScope.of(context).unfocus();
    final ref = context.read<WalletVm>();
    final res = await ref.addMyBankDetails(
      bankId: selectedBank?.id ?? '',
      accountNumber: accountNumberC.text,
    );

    handleApiResponse(
      response: res,
      onSuccess: () {
        Navigator.pop(context);
        // Navigator.pushNamed(
        //   context,
        //   RoutePath.withdrawChooseAccount,
        // );
      },
    );
  }
}
