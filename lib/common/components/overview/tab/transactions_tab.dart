import 'package:soto_ecommerce/common/common.dart';

class TransactionsTab extends StatelessWidget {
  const TransactionsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    itemBuilder: (_, i) => WalletHistoryListTile(
                      isSend: (i + 1) % 2 == 0,
                    ),
                    separatorBuilder: (_, __) => const Divider(
                      color: AppColors.dividerColor,
                    ),
                    itemCount: 3,
                  ),
                ],
              );
            },
            separatorBuilder: (_, __) => const YBox(40),
            itemCount: 3,
          )
        ],
      ),
    );
  }
}
