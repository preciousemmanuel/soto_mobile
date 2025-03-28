import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool showAmount = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VendorDashboardVM>().getTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthUserVM>(
      builder: (context, vm, _) {
        return Scaffold(
          body: Container(
            width: Sizer.screenWidth,
            height: Sizer.screenHeight,
            decoration: const BoxDecoration(
              gradient: AppColors.walletBgGradient,
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  const YBox(20),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizer.width(20),
                    ),
                    child: Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.white,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(Sizer.radius(100))),
                              child: Icon(
                                Iconsax.user,
                                size: Sizer.width(24),
                                color: AppColors.white,
                              ),
                            ),
                            // SizedBox(
                            //   height: Sizer.height(32),
                            //   width: Sizer.width(32),
                            //   child: ClipRRect(
                            //     borderRadius:
                            //         BorderRadius.circular(Sizer.width(32)),
                            //     child: imageHelper(AppImages.avatar),
                            //   ),
                            // ),
                            const XBox(10),
                            Text(
                              vm.authUser?.firstName?.capitalizeFirstLetter() ??
                                  '',
                              style: AppTypography.text14.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        NotificationIocnWidget(
                          iconColor: AppColors.white,
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutePath.notificationScreen);
                          },
                        ),
                      ],
                    ),
                  ),
                  const YBox(16),
                  Container(
                    height: Sizer.height(162),
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                      horizontal: Sizer.width(20),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.red23,
                      borderRadius: BorderRadius.circular(Sizer.radius(24)),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Available Balance',
                                style: AppTypography.text14.copyWith(
                                  color: AppColors.redD5,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const XBox(12),
                              InkWell(
                                onTap: () {
                                  showAmount = !showAmount;
                                  setState(() {});
                                },
                                child: Icon(
                                  showAmount ? Iconsax.eye_slash : Iconsax.eye,
                                  size: 20,
                                  color: AppColors.redD5,
                                ),
                              ),
                            ],
                          ),
                          const YBox(10),
                          Text(
                            showAmount
                                ? '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(
                                    (vm.wallet?.currentBalance ?? 0.0)
                                        .toString(),
                                  )}'
                                : '${AppUtils.nairaSymbol}*******',
                            style: GoogleFonts.roboto(
                              fontSize: Sizer.text(42),
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const YBox(15),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteFB,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Sizer.radius(30)),
                          topRight: Radius.circular(Sizer.radius(30)),
                        ),
                      ),
                      child: Column(
                        children: [
                          const YBox(20),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizer.width(20),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomBtn.withChild(
                                    height: Sizer.height(44),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Iconsax.money_send,
                                          size: Sizer.radius(24),
                                          color: AppColors.white,
                                        ),
                                        const XBox(6),
                                        Text(
                                          'Withdraw',
                                          style: AppTypography.text14.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          RoutePath.withdrawChooseAccount);
                                    },
                                  ),
                                ),
                                const XBox(20),
                                Expanded(
                                  child: CustomBtn.withChild(
                                    isOutline: true,
                                    height: Sizer.height(44),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Iconsax.money_send,
                                          size: Sizer.radius(24),
                                          color: AppColors.primaryOrange,
                                        ),
                                        const XBox(6),
                                        Text(
                                          'Requests',
                                          style: AppTypography.text14.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppColors.primaryOrange,
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      Navigator.pushNamed(context,
                                          RoutePath.withdrawRequestScreen);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const YBox(30),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizer.width(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recent Transactions',
                                  style: AppTypography.text16.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        RoutePath.allTransactionsScreen);
                                  },
                                  child: Text(
                                    'See All',
                                    style: AppTypography.text12.copyWith(
                                      color: AppColors.primaryOrange,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const YBox(20),
                          Consumer<VendorDashboardVM>(
                              builder: (context, ref, _) {
                            if (ref.isBusy) {
                              return const SizerLoader();
                            }
                            if (ref.transactionList.isEmpty) {
                              return const EmptyListState(
                                height: 200,
                                text: 'No transactions yet',
                              );
                            }
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (_, i) {
                                final transaction = ref.transactionList[i];
                                return WalletHistoryListTile(
                                  isSend: false,
                                  reference: transaction.reference ?? '',
                                  naration: transaction.narration ?? '',
                                  amount:
                                      (transaction.amount ?? 0.0).toString(),
                                  date: AppUtils.formatDateTime(
                                      (transaction.createdAt ?? DateTime.now())
                                          .toLocal()
                                          .toString()),
                                );
                              },
                              separatorBuilder: (_, __) => const Divider(
                                color: AppColors.dividerColor,
                              ),
                              itemCount: ref.transactionList.take(5).length,
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
