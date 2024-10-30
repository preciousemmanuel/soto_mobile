import 'package:soto_ecommerce/common/common.dart';

class AllTransactionsScreen extends StatelessWidget {
  const AllTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
