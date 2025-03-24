import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class AllTransactionsScreen extends StatefulWidget {
  const AllTransactionsScreen({super.key});

  @override
  State<AllTransactionsScreen> createState() => _AllTransactionsScreenState();
}

class _AllTransactionsScreenState extends State<AllTransactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VendorDashboardVM>(
      builder: (context, ref, _) {
        return Scaffold(
          backgroundColor: AppColors.bgWhite,
          body: SafeArea(
            bottom: false,
            child: ListView(
              shrinkWrap: true,
              children: [
                const YBox(20),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.only(
                      left: Sizer.width(20),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Iconsax.arrow_left_2,
                      color: AppColors.black33,
                      size: Sizer.width(24),
                    ),
                  ),
                ),
                const YBox(10),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizer.width(20),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'All Transactions',
                        style: AppTypography.text16.copyWith(
                          color: AppColors.black33,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Sort',
                        style: AppTypography.text12.copyWith(
                          color: AppColors.primaryOrange,
                        ),
                      ),
                    ],
                  ),
                ),
                const YBox(20),
                Builder(builder: (context) {
                  if (ref.transactionList.isEmpty) {
                    return const EmptyListState(
                      text: 'No transactions yet',
                    );
                  }
                  return ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.only(
                      top: Sizer.height(10),
                      bottom: Sizer.height(100),
                    ),
                    children: ref.groupedTransactionList.entries.map((e) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizer.width(20),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  e.key,
                                  style: AppTypography.text14.copyWith(
                                    color: AppColors.black33,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const YBox(10),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, i) {
                              final t = e.value[i];
                              return WalletHistoryListTile(
                                // isSend: (i + 1) % 2 == 0,
                                reference: t.reference ?? '',
                                naration: t.narration ?? '',
                                amount: (t.amount ?? 0.0).toString(),
                                date: AppUtils.formatDateTime(
                                    (t.createdAt ?? DateTime.now())
                                        .toLocal()
                                        .toString()),
                              );
                            },
                            separatorBuilder: (_, __) => const Divider(
                              color: AppColors.dividerColor,
                            ),
                            itemCount: e.value.length,
                          ),
                        ],
                      );
                    }).toList(),
                  );
                })
              ],
            ),
          ),
        );
      },
    );
  }
}
