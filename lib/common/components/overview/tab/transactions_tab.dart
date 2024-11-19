import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class TransactionsTab extends StatelessWidget {
  const TransactionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<VendorDashboardVM>(
      builder: (context, ref, _) {
        if (ref.transactionList.isEmpty) {
          return const EmptyListState(
            // height: 200,
            text: 'No transactions yet',
          );
        }
        return Expanded(
          child: ListView(
            shrinkWrap: true,
            children: [
              const YBox(24),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) {
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
                              'Today, Oct. 13th, 2024',
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
                          final transaction = ref.transactionList[i];
                          return WalletHistoryListTile(
                            isSend: (i + 1) % 2 == 0,
                            naration: transaction.narration ?? '',
                            amount: (transaction.amount ?? 0.0).toString(),
                            date: AppUtils.formatDateTime(
                                (transaction.createdAt ?? DateTime.now())
                                    .toLocal()
                                    .toString()),
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(
                          color: AppColors.dividerColor,
                        ),
                        itemCount: ref.transactionList.length,
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) => const YBox(40),
                itemCount: ref.transactionList.length,
              )
            ],
          ),
        );
      },
    );
  }
}
