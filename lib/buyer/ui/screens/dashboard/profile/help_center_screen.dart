import 'package:soto_ecommerce/buyer/buyer.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const YBox(10),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: CustomHeader(
                title: 'Help Center',
                backBtn: () {},
              ),
            ),
            const YBox(100),
          ],
        ),
      ),
    );
  }
}
