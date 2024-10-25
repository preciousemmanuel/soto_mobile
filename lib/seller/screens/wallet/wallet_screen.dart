import 'package:soto_ecommerce/common/common.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        SizedBox(
                          height: Sizer.height(32),
                          width: Sizer.width(32),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Sizer.width(32)),
                            child: imageHelper(AppImages.avatar),
                          ),
                        ),
                        const XBox(4),
                        Text(
                          'ClassyXly',
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
                          const Icon(
                            Iconsax.eye,
                            size: 20,
                            color: AppColors.redD5,
                          ),
                        ],
                      ),
                      const YBox(10),
                      Text(
                        'N11,547.54',
                        style: AppTypography.text48.copyWith(
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
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  Navigator.pushNamed(
                                      context, RoutePath.addOrderScreen);
                                },
                              ),
                            ),
                            const XBox(20),
                            Expanded(
                              child: CustomBtn.withChild(
                                isOutline: true,
                                height: Sizer.height(44),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                  Navigator.pushNamed(
                                      context, RoutePath.addOrderScreen);
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
                            Text(
                              'See All',
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
                        itemBuilder: (_, __) => const WalletHistoryListTile(),
                        separatorBuilder: (_, __) => const Divider(
                          color: AppColors.dividerColor,
                        ),
                        itemCount: 5,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WalletHistoryListTile extends StatelessWidget {
  const WalletHistoryListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
        vertical: Sizer.height(4),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(Sizer.radius(10)),
            decoration: BoxDecoration(
              color: AppColors.greenE9,
              borderRadius: BorderRadius.circular(
                Sizer.radius(30),
              ),
            ),
            child: svgHelper(AppSvgs.receive),
          ),
          const XBox(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Order Payment',
                style: AppTypography.text14.copyWith(
                  color: AppColors.black33,
                ),
              ),
              const YBox(2),
              Text(
                '#212323',
                style: AppTypography.text14.copyWith(
                  color: AppColors.black66,
                ),
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'N50,000',
                style: AppTypography.text15.copyWith(
                  color: AppColors.green78,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YBox(2),
              Text(
                'October 25th, 2024',
                style: AppTypography.text12.copyWith(
                  color: AppColors.black66,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
