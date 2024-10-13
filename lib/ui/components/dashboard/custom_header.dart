import 'package:soto_ecommerce/lib.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    this.showBackBtn = false,
    this.showHeader = false,
    this.isHeaderText = true,
    this.color,
    this.headerText,
    this.headerWidget,
    this.onBackBtnTap,
  });

  final bool showBackBtn;
  final bool showHeader;
  final bool isHeaderText;
  final Color? color;
  final String? headerText;
  final Widget? headerWidget;
  final VoidCallback? onBackBtnTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          showHeader ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        const BackIcon(),
        if (showHeader)
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.only(right: Sizer.width(showBackBtn ? 60 : 0)),
              child: Center(
                child: isHeaderText
                    ? Text(
                        headerText ?? '',
                        style: AppTypography.text16.copyWith(
                          fontWeight: FontWeight.w600,
                          color: color ?? AppColors.text12,
                        ),
                      )
                    : headerWidget,
              ),
            ),
          ),
      ],
    );
  }
}
