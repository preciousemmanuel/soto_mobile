import 'package:soto_ecommerce/common/common.dart';

class ForgetPasswordPageview extends StatelessWidget {
  const ForgetPasswordPageview({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.controller,
  });

  final String icon;
  final String title;
  final String subTitle;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          imageHelper(
            icon,
            height: Sizer.height(140),
          ),
          const YBox(24),
          Text(
            title,
            style: AppTypography.text32.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const YBox(8),
          Text(
            subTitle,
            textAlign: TextAlign.center,
            style: AppTypography.text14.copyWith(
              color: AppColors.text7D,
            ),
          ),
          const YBox(36),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                hintText: 'Email /Phone number',
                onChanged: (val) {},
              ),
              const YBox(30),
              CustomBtn.solid(
                onTap: () {
                  controller.nextPage(
                      duration: const Duration(seconds: 1), curve: Curves.ease);
                },
                text: "Continue",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
