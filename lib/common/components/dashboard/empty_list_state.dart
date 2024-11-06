import 'package:soto_ecommerce/common/common.dart';

class EmptyListState extends StatelessWidget {
  const EmptyListState({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizer.height(500),
      width: Sizer.screenWidth,
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTypography.text16.copyWith(
            color: AppColors.text28,
          ),
        ),
      ),
    );
  }
}
