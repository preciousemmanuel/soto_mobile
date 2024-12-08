import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class TransactionsTab extends StatefulWidget {
  const TransactionsTab({
    super.key,
  });

  @override
  State<TransactionsTab> createState() => _TransactionsTabState();
}

class _TransactionsTabState extends State<TransactionsTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<VendorDashboardVM>().getTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VendorDashboardVM>(
      builder: (context, ref, _) {
        if (ref.isBusy) {
          return const SizerLoader(
            height: 500,
          );
        }
        if (ref.transactionList.isEmpty) {
          return const EmptyListState(
            // height: 200,
            text: 'No transactions yet',
          );
        }
        return ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(
            top: Sizer.height(30),
            bottom: Sizer.height(100),
          ),
          physics: const NeverScrollableScrollPhysics(),
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
                          (t.createdAt ?? DateTime.now()).toLocal().toString()),
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
      },
    );
  }
}
