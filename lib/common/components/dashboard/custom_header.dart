import 'package:soto_ecommerce/common/common.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  const CustomHeader({
    super.key,
    required this.title,
    this.color,
    this.showBackBtn = true,
    this.titleWeight,
    this.padding,
    this.backBtn,
    this.titleStyle,
    this.trailingWidget,
  });

  final String title;
  final Color? color;
  final bool showBackBtn;
  final VoidCallback? backBtn;
  final FontWeight? titleWeight;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(Sizer.height(50)),
      child: Padding(
        padding: padding ??
            EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // const BackIcon(icon: AppSvgs.arrowLeft),
                showBackBtn
                    ? InkWell(
                        onTap: showBackBtn
                            ? (backBtn ?? () => Navigator.pop(context))
                            : null,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          child: svgHelper(
                            AppSvgs.arrowLeft,
                          ),
                        ),
                      )
                    : Container(),
                Container(
                  padding: trailingWidget == null
                      ? null
                      : EdgeInsets.only(
                          right: Sizer.width(showBackBtn ? 20 : 0),
                        ),
                  child: Text(
                    title,
                    style: titleStyle ??
                        AppTypography.text24.copyWith(
                          fontWeight: titleWeight ?? FontWeight.w600,
                          color: color ?? AppColors.text12,
                        ),
                  ),
                ),
                Container(child: trailingWidget),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(Sizer.height(50));
}
