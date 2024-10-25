import 'package:soto_ecommerce/common/common.dart';

class FAQTabView extends StatefulWidget {
  const FAQTabView({
    super.key,
  });

  @override
  State<FAQTabView> createState() => _FAQTabViewState();
}

class _FAQTabViewState extends State<FAQTabView> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
        vertical: Sizer.width(24),
      ),
      child: Column(
        children: [
          FAQAccordion(
            title: 'Do I have to sign up?',
            descrption:
                'Soto offers you the opportunity to explore the amazing features on the platform before your decision to sign up.',
            isExpanded: currentIndex == 0,
            onTap: () {
              currentIndex = 0;
              setState(() {});
            },
          ),
          const YBox(24),
          FAQAccordion(
            title: 'How do I get started?',
            descrption:
                'Soto offers you the opportunity to explore the amazing features on the platform before your decision to sign up.',
            isExpanded: currentIndex == 1,
            onTap: () {
              currentIndex = 1;
              setState(() {});
            },
          ),
          const YBox(24),
          FAQAccordion(
            title: 'How do I get started?',
            descrption:
                'Soto offers you the opportunity to explore the amazing features on the platform before your decision to sign up.',
            isExpanded: currentIndex == 2,
            onTap: () {
              currentIndex = 2;
              setState(() {});
            },
          ),
          const YBox(24),
          FAQAccordion(
            title: 'How do I get started?',
            descrption:
                'Soto offers you the opportunity to explore the amazing features on the platform before your decision to sign up.',
            isExpanded: currentIndex == 3,
            onTap: () {
              currentIndex = 3;
              setState(() {});
            },
          ),
          const YBox(24),
          FAQAccordion(
            title: 'How do I get started?',
            descrption:
                'Soto offers you the opportunity to explore the amazing features on the platform before your decision to sign up.',
            isExpanded: currentIndex == 4,
            onTap: () {
              currentIndex = 4;
              setState(() {});
            },
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
