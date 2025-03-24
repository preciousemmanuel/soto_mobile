import 'package:soto_ecommerce/common/common.dart';

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
          NotificationIocnWidget(
            onTap: () {
              Navigator.pushNamed(context, RoutePath.notificationScreen);
            },
          ),
        ],
      ),
    );
  }
}

class NotificationIocnWidget extends StatelessWidget {
  const NotificationIocnWidget({
    super.key,
    this.iconColor,
    this.iconSize,
    this.onTap,
  });

  final Color? iconColor;
  final double? iconSize;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationVm>(builder: (ctx, ref, _) {
      return InkWell(
        onTap: onTap,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              Iconsax.notification,
              color: iconColor ?? AppColors.text12,
              size: Sizer.radius(iconSize ?? 28),
            ),
            Positioned(
              right: -4,
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
                child: Center(
                  child: Text(
                    '${ref.notificationList.length}',
                    style: const TextStyle(
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
      );
    });
  }
}
