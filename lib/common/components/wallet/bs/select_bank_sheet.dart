import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/wallet_vm.dart';

class SelectBankSheet extends StatefulWidget {
  const SelectBankSheet({super.key});

  @override
  State<SelectBankSheet> createState() => _SelectBankSheetState();
}

class _SelectBankSheetState extends State<SelectBankSheet> {
  TextEditingController searchC = TextEditingController();
  FocusNode searchF = FocusNode();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  @override
  void dispose() {
    searchC.dispose();
    searchF.dispose();

    super.dispose();
  }

  _init() {
    final vm = context.read<WalletVm>();
    vm.fetchAllBanks();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletVm>(builder: (ctx, ref, _) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          height: Sizer.screenHeight * 0.65,
          width: Sizer.screenWidth,
          padding: EdgeInsets.only(
            left: Sizer.width(20),
            right: Sizer.width(20),
          ),
          decoration: BoxDecoration(
            color: AppColors.bgWhite,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                Sizer.width(12),
              ),
              topRight: Radius.circular(
                Sizer.width(12),
              ),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const YBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Select Bank",
                    style: AppTypography.text16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      size: Sizer.radius(23),
                    ),
                  )
                ],
              ),
              const YBox(30),
              Expanded(
                child: Builder(builder: (context) {
                  if (ref.isBusy) {
                    return const SizerLoader();
                  }
                  if (ref.allBankList.isEmpty) {
                    return const Center(
                      child: EmptyListState(text: "No Bank Found"),
                    );
                  }
                  return Column(
                    children: [
                      CustomTextField(
                        focusNode: searchF,
                        controller: searchC,
                        hintText: 'Search Bank',
                        showfillColor: false,
                        borderColor: AppColors.grayDE,
                        prefixIcon: Icon(
                          Iconsax.search_normal_1,
                          color: AppColors.iconC4,
                          size: Sizer.height(20),
                        ),
                        onChanged: (val) {},
                        onSubmitted: (val) {},
                      ),
                      const YBox(20),
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(
                            bottom: Sizer.height(100),
                          ),
                          itemBuilder: (_, i) {
                            final bank = ref.allBankList[i];
                            return BankTile(
                              bankName: bank.name ?? "",
                              onTap: () {
                                Navigator.pop(context, bank);
                              },
                            );
                          },
                          separatorBuilder: (_, __) => const YBox(10),
                          itemCount: ref.allBankList.length,
                        ),
                      )
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class BankTile extends StatelessWidget {
  const BankTile({
    super.key,
    required this.bankName,
    this.onTap,
  });
  final String bankName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
          vertical: Sizer.height(10),
        ),
        decoration: BoxDecoration(
          color: AppColors.bgWhite,
          borderRadius: BorderRadius.circular(
            Sizer.radius(10),
          ),
          border: Border.all(
            color: AppColors.grayDE,
          ),
        ),
        child: Text(
          bankName,
          style: AppTypography.text14.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
