import 'package:soto_ecommerce/buyer/buyer.dart';

class HomeNotificationHeader extends StatelessWidget {
  const HomeNotificationHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Get',
                    style: AppTypography.text24.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: ' Everything ',
                    style: AppTypography.text24.copyWith(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'You \nNeed in ',
                    style: AppTypography.text24.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'One Place',
                    style: AppTypography.text24.copyWith(
                      color: AppColors.primaryOrange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              RouterNav.push(context, const NotificationScreen());
            },
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  Iconsax.notification,
                  color: AppColors.text12,
                  size: Sizer.radius(28),
                ),
                Positioned(
                  right: -12,
                  top: -10,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizer.width(2),
                      vertical: Sizer.height(1),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryOrange,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Center(
                      child: Text(
                        '99+',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
