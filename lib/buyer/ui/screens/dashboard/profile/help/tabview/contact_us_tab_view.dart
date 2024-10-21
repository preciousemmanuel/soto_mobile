import 'package:soto_ecommerce/buyer/core/core.dart';

class ContactUsTabView extends StatelessWidget {
  const ContactUsTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
        vertical: Sizer.width(24),
      ),
      child: Column(
        children: [
          ContactUsListTile(
            text: 'Customer Services',
            icon: AppSvgs.call,
            h: Sizer.height(24),
            w: Sizer.width(24),
            onTap: () {},
          ),
          const YBox(24),
          ContactUsListTile(
            text: 'WhatsApp',
            icon: AppSvgs.ws,
            h: Sizer.height(32),
            w: Sizer.width(32),
            onTap: () {},
          ),
          const YBox(24),
          ContactUsListTile(
            text: 'Facebook',
            icon: AppSvgs.fb,
            h: Sizer.height(32),
            w: Sizer.width(32),
            onTap: () {},
          ),
          const YBox(24),
          ContactUsListTile(
            text: 'Twitter',
            icon: AppSvgs.x,
            h: Sizer.height(32),
            w: Sizer.width(32),
            onTap: () {},
          ),
          const YBox(24),
          ContactUsListTile(
            text: 'Instagram',
            icon: AppSvgs.ig,
            h: Sizer.height(32),
            w: Sizer.width(32),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class ContactUsListTile extends StatelessWidget {
  const ContactUsListTile({
    super.key,
    required this.text,
    required this.icon,
    this.h,
    this.w,
    this.onTap,
  });

  final String text;
  final String icon;
  final double? h;
  final double? w;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(10),
          vertical: Sizer.height(16),
        ),
        decoration: BoxDecoration(
          color: AppColors.bgWhite,
          borderRadius: BorderRadius.circular(
            Sizer.radius(12),
          ),
        ),
        child: Row(
          children: [
            svgHelper(icon, height: h, width: w),
            const XBox(16),
            Text(
              text,
              style: AppTypography.text14.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
