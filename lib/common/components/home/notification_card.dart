import 'package:soto_ecommerce/common/common.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
    this.onTap,
    this.onDelete,
  });

  final String title;
  final String subtitle;
  final String time;
  final Function()? onTap;
  final Function()? onDelete;

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
                  title,
                  style: AppTypography.text16.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.text1A,
                  ),
                ),
                const YBox(4),
                Text(subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTypography.text12.copyWith(
                      color: AppColors.text5C,
                    )),
                const YBox(8),
                Text(
                  time,
                  style: AppTypography.text10.copyWith(
                    color: AppColors.text70,
                  ),
                ),
              ],
            ),
          ),
          const XBox(24),
          InkWell(
            onTap: onDelete,
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
