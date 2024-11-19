import 'package:soto_ecommerce/buyer/buyer.dart';
import 'package:soto_ecommerce/common/common.dart';

class PasswordScreenArgs {
  final PasswordType type;
  const PasswordScreenArgs({
    this.type = PasswordType.forgotPassword,
  });
}

class ChangeOrForgotPasswordScreen extends StatefulWidget {
  const ChangeOrForgotPasswordScreen({
    super.key,
    this.args,
  });

  final PasswordScreenArgs? args;

  @override
  State<ChangeOrForgotPasswordScreen> createState() =>
      _ChangeOrForgotPasswordScreenState();
}

class _ChangeOrForgotPasswordScreenState
    extends State<ChangeOrForgotPasswordScreen> {
  int currentIndex = 0;
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    printty('arg ${widget.args?.type}');
    return BusyOverlay(
      show: context.watch<PasswordVM>().isBusy,
      child: Scaffold(
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
                    Navigator.pop(context);
                    context.read<PasswordVM>().clearData();
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
                    final collections =
                        widget.args?.type == PasswordType.changePassword
                            ? AppText.changePasswordCollections
                            : AppText.forgotPasswordCollections;
                    switch (index) {
                      case 0:
                        return ForgetPasswordPageview(
                          icon: collections[index]['img'],
                          title: collections[index]['title'],
                          subTitle: collections[index]['subTitle'],
                          controller: controller,
                        );
                      case 1:
                        return OtpPageview(
                          icon: collections[index]['img'],
                          title: collections[index]['title'],
                          subTitle: collections[index]['subTitle'],
                          controller: controller,
                        );
                      case 2:
                        return ResetPasswordPageview(
                          icon: collections[index]['img'],
                          title: collections[index]['title'],
                          subTitle: collections[index]['subTitle'],
                          controller: controller,
                          type: widget.args?.type,
                        );
                      default:
                        return ForgetPasswordPageview(
                          icon: collections[index]['img'],
                          title: collections[index]['title'],
                          subTitle: collections[index]['subTitle'],
                          controller: controller,
                        );
                    }
                  },
                  itemCount: widget.args?.type == PasswordType.changePassword
                      ? AppText.changePasswordCollections.length
                      : AppText.forgotPasswordCollections.length,
                  onPageChanged: (index) {
                    onIndexChanged(index);
                  },
                ),
              )
            ],
          ),
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
