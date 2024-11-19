import 'package:soto_ecommerce/common/common.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: const CustomHeader(
        title: 'Notifications',
        titleWeight: FontWeight.w500,
      ),
      body: SizedBox(
        width: Sizer.screenWidth,
        height: Sizer.screenHeight,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(20),
          ),
          shrinkWrap: true,
          children: [
            const YBox(14),
            Container(
              decoration: BoxDecoration(
                color: AppColors.bgWhite,
                borderRadius: BorderRadius.circular(Sizer.radius(14)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.1),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: Sizer.width(16),
                      right: Sizer.width(16),
                      top: Sizer.height(20),
                      bottom: Sizer.height(8),
                    ),
                    child: Text(
                      'Updates',
                      style: AppTypography.text14.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.text5C,
                      ),
                    ),
                  ),
                  const Divider(
                    color: AppColors.dividerColor,
                    thickness: 0.5,
                  ),
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, __) {
                      return const NotificationCard();
                    },
                    separatorBuilder: (_, __) => const Divider(thickness: 0.5),
                    itemCount: 5,
                  ),
                  const YBox(70),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: Sizer.width(16),
        right: Sizer.width(16),
        top: Sizer.height(8),
        bottom: Sizer.height(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Soto! 🚀',
                  style: AppTypography.text16.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.text1A,
                  ),
                ),
                const YBox(4),
                Text(
                    'Congratulations on joining Soto, the thriving online shopping App for buying and selling! We\'re excited to have you on board. .',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.text12.copyWith(
                      color: AppColors.text5C,
                    )),
                const YBox(8),
                Text('3mins ago',
                    style: AppTypography.text10.copyWith(
                      color: AppColors.text70,
                    )),
              ],
            ),
          ),
          const XBox(24),
          InkWell(
            onTap: () {},
            child: Icon(
              Iconsax.trash,
              color: AppColors.primaryOrange,
              size: Sizer.radius(20),
            ),
          ),
        ],
      ),
    );
  }
}
