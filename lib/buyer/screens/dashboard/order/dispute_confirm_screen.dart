import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';

class DisputeConfirmScreen extends StatelessWidget {
  const DisputeConfirmScreen({
    super.key,
    required this.args,
  });

  final DisputeArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(30),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            imageHelper(
              AppImages.faSend,
              height: Sizer.height(90),
            ),
            const YBox(30),
            Text(
              'Dispute Raised ',
              style: GoogleFonts.inter(
                color: AppColors.primaryOrange,
                fontSize: Sizer.text(20),
                fontWeight: FontWeight.w600,
              ),
            ),
            const YBox(10),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'You successfully raised a dispute with case ID',
                    style: GoogleFonts.inter(
                      color: AppColors.text32.withOpacity(0.35),
                      fontSize: Sizer.text(14),
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text: '\n${args.disputeId}',
                    style: GoogleFonts.inter(
                      color: AppColors.text32,
                      fontSize: Sizer.text(14),
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  TextSpan(
                    text:
                        '. We will investigate this dispute case and get back to you within 24 hours.',
                    style: GoogleFonts.inter(
                      color: AppColors.text32.withOpacity(0.35),
                      fontSize: Sizer.text(14),
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            const YBox(200),
            CustomBtn.solid(
              isOutline: true,
              height: Sizer.height(50),
              text: "Back to Home",
              textColor: AppColors.primaryOrange,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, RoutePath.dashboardNavScreen, (route) => false);
              },
            ),
            const YBox(70),
          ],
        ),
      ),
    );
  }
}
