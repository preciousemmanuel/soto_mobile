import 'package:soto_ecommerce/buyer/buyer.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  int currentIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgFF,
      body: SafeArea(
        child: Column(
          children: [
            const YBox(10),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: BackIcon(
                onTap: () {
                  goBack(currentIndex);
                },
              ),
            ),
            const YBox(4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SwipeIndicator(
                  isActive: currentIndex == 0,
                ),
                const XBox(8),
                SwipeIndicator(
                  isActive: currentIndex == 1,
                ),
                const XBox(8),
                SwipeIndicator(
                  isActive: currentIndex == 2,
                ),
              ],
            ),
            const YBox(26),
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                itemBuilder: (BuildContext context, int index) {
                  switch (index) {
                    case 0:
                      return ForgetPasswordPageview(
                        icon: AppText.collections[index]['img'],
                        title: AppText.collections[index]['title'],
                        subTitle: AppText.collections[index]['subTitle'],
                        controller: controller,
                      );
                    case 1:
                      return OtpPageview(
                        icon: AppText.collections[index]['img'],
                        title: AppText.collections[index]['title'],
                        subTitle: AppText.collections[index]['subTitle'],
                        controller: controller,
                      );
                    case 2:
                      return ResetPasswordPageview(
                        icon: AppText.collections[index]['img'],
                        title: AppText.collections[index]['title'],
                        subTitle: AppText.collections[index]['subTitle'],
                        controller: controller,
                      );
                    default:
                      return ForgetPasswordPageview(
                        icon: AppText.collections[index]['img'],
                        title: AppText.collections[index]['title'],
                        subTitle: AppText.collections[index]['subTitle'],
                        controller: controller,
                      );
                  }
                },
                itemCount: AppText.collections.length,
                onPageChanged: (index) {
                  onIndexChanged(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onIndexChanged(int index) {
    if (currentIndex <= 3) {
      setState(() {
        currentIndex = index;
      });
    } else {
      currentIndex = 0;
    }
  }

  void goBack(int index) {
    if (currentIndex > 0) {
      controller.previousPage(
          duration: const Duration(seconds: 1), curve: Curves.ease);
    } else {
      Navigator.pop(context);
    }
  }
}
