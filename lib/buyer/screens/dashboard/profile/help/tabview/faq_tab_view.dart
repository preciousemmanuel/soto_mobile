import 'package:soto_ecommerce/common/common.dart';

class FAQTabView extends StatefulWidget {
  const FAQTabView({
    super.key,
  });

  @override
  State<FAQTabView> createState() => _FAQTabViewState();
}

class _FAQTabViewState extends State<FAQTabView> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
        vertical: Sizer.width(24),
      ),
      child: Column(
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, i) => FAQAccordion(
                title: AppText.faqs[i]['title'],
                descrption: AppText.faqs[i]['subTitle'],
                isExpanded: i == currentIndex,
                onTap: () {
                  if (i == currentIndex) {
                    currentIndex = -1;
                  } else {
                    currentIndex = i;
                  }
                  setState(() {});
                }),
            separatorBuilder: (_, __) => const YBox(20),
            itemCount: AppText.faqs.length,
          ),
        ],
      ),
    );
  }
}

class FAQAccordion extends StatelessWidget {
  const FAQAccordion({
    super.key,
    required this.title,
    required this.descrption,
    this.isExpanded = false,
    this.onTap,
  });

  final String title;
  final String descrption;
  final bool isExpanded;
  final VoidCallback? onTap;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: AppTypography.text14.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.black3D,
                  ),
                ),
                const Spacer(),
                AnimatedRotation(
                  duration: const Duration(milliseconds: 500),
                  turns: isExpanded ? 0.5 : 0,
                  child: svgHelper(AppSvgs.arrowDown),
                ),
              ],
            ),
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: isExpanded
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const YBox(16),
                        const Divider(
                          color: AppColors.dividerColor,
                          thickness: 2,
                        ),
                        const YBox(16),
                        Text(
                          descrption,
                          style: AppTypography.text12.copyWith(
                            color: AppColors.text8D,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
