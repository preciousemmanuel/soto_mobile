import 'package:soto_ecommerce/common/common.dart';

class CheckoutPaymentScreen extends StatelessWidget {
  const CheckoutPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgFB,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(20),
          ),
          children: [
            const YBox(10),
            const CustomHeader(
              title: 'Payment',
            ),
            const YBox(7),
            Text(
              'Kindly choose a payment method \nto proceed',
              textAlign: TextAlign.center,
              style: AppTypography.text12.copyWith(
                color: AppColors.text56,
              ),
            ),
            const YBox(30),
            PaymentTile(
              isSelected: true,
              title: 'Credit Card',
              icon: AppSvgs.mscard,
              onTap: () {
                Navigator.pushNamed(context, RoutePath.confirmPaymentScreen);
              },
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
            Text(
              'History',
              style: AppTypography.text20.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            const YBox(16),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, __) => const PaymentProductHistoryTile(),
                separatorBuilder: (_, __) => const YBox(16),
                itemCount: 3),
            const YBox(100),
          ],
        ),
      ),
    );
  }
}

class PaymentProductHistoryTile extends StatelessWidget {
  const PaymentProductHistoryTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Sizer.radius(10)),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Sizer.radius(8)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ]),
      child: Row(
        children: [
          SizedBox(
            width: Sizer.width(60),
            height: Sizer.height(60),
            child: ClipRRect(
              child: imageHelper(
                AppImages.product2,
              ),
            ),
          ),
          const XBox(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deck Chair Twill',
                  style: AppTypography.text12.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Luxury bag for party',
                  style: AppTypography.text12.copyWith(
                    color: AppColors.gray500,
                  ),
                ),
                const YBox(4),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: Sizer.width(4),
                    vertical: Sizer.height(2),
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grayEF,
                    borderRadius: BorderRadius.circular(Sizer.radius(4)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      svgHelper(AppSvgs.received),
                      const XBox(4),
                      Text(
                        'Received',
                        style: AppTypography.text12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const XBox(16),
          Text(
            'N10,000',
            style: AppTypography.text14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
