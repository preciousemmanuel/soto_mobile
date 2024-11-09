import 'package:soto_ecommerce/common/common.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthUserVM>(
      builder: (context, ref, _) {
        return Scaffold(
          backgroundColor: AppColors.bgF5,
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const YBox(10),
                  const CustomHeader(
                    title: 'My Profile',
                    titleWeight: FontWeight.w500,
                  ),
                  const YBox(30),
                  imageHelper(
                    AppImages.creditCard,
                    height: Sizer.height(200),
                    fit: BoxFit.cover,
                  ),
                  const YBox(30),
                  PaymentTile(
                    isSelected: true,
                    title: 'Credit Card',
                    icon: AppSvgs.mscard,
                    onTap: () {},
                  ),
                  const YBox(16),
                  PaymentTile(
                    title: 'PayStack',
                    icon: AppSvgs.paystack,
                    onTap: () {},
                  ),
                  const YBox(16),
                  PaymentTile(
                    title: 'Paypal',
                    icon: AppSvgs.paypal,
                    onTap: () {},
                  ),
                  const YBox(16),
                  const PaymentAddCard(),
                  const YBox(40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
