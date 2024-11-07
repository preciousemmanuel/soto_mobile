import 'package:soto_ecommerce/common/common.dart';

class SelectCategoryField extends StatelessWidget {
  const SelectCategoryField({
    super.key,
    required this.text,
    this.isExpanded = false,
    this.hasBeenSelected = false,
    this.isLoading = false,
    this.bgColor,
    this.borderColor,
    this.children = const <Widget>[],
    this.onSelect,
  });

  final String text;
  final bool isExpanded;
  final bool hasBeenSelected;
  final bool isLoading;
  final Color? bgColor;
  final Color? borderColor;
  final List<Widget> children; // const <Widget>[],
  final Function()? onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(14),
          vertical: Sizer.height(14),
        ),
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.orangeEA.withOpacity(0.5),
          border: Border.all(
            color: borderColor ?? AppColors.transparent,
          ),
          borderRadius: BorderRadius.circular(Sizer.width(10)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.element_2,
                  color: AppColors.iconC4,
                  size: Sizer.height(20),
                ),
                const XBox(10),
                Expanded(
                  child: Text(
                    text,
                    style: AppTypography.text14.copyWith(
                      fontWeight: FontWeight.w400,
                      color:
                          hasBeenSelected ? AppColors.text12 : AppColors.text8D,
                    ),
                  ),
                ),
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
                  ? Builder(builder: (context) {
                      if (isLoading) {
                        return SizedBox(
                          height: Sizer.height(100),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryOrange,
                            ),
                          ),
                        );
                      }
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: children,
                      );
                    })
                  : const SizedBox.shrink(),
            )
          ],
        ),
      ),
    );
  }
}
