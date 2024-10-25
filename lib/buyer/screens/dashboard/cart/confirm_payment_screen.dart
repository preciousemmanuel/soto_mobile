import 'package:soto_ecommerce/common/common.dart';

class ConfirmPaymentScreen extends StatelessWidget {
  const ConfirmPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgFB,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          children: [
            const YBox(20),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: const CustomHeader(
                title: 'Confirm Payment',
              ),
            ),
            const YBox(30),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: Wrap(
                spacing: 30,
                runSpacing: 20,
                children: List.generate(
                  3,
                  (i) => ConfirmPaymentProduct(
                    image: AppImages.product2,
                    name: 'Wooden chair',
                    onTap: () {},
                  ),
                ),
              ),
            ),
            const YBox(10),
            const Divider(color: AppColors.dividerColor),
            const CustomPaymentListTile(
              leftText: 'Number of items',
              rightText: '3',
            ),
            const CustomPaymentListTile(
              leftText: 'Total Amount',
              rightText: 'N504,000',
            ),
            const CustomPaymentListTile(
              leftText: 'Vats',
              rightText: 'N200',
            ),
            CustomPaymentListTile(
              leftText: 'Shipping',
              rightText: '0',
              leftStyle: AppTypography.text16.copyWith(
                color: AppColors.primaryOrange,
              ),
              rightStyle: AppTypography.text16.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primaryOrange,
              ),
            ),
            const Divider(color: AppColors.dividerColor),
            CustomPaymentListTile(
              leftText: 'Total',
              rightText: 'N504,200',
              leftStyle: AppTypography.text20.copyWith(
                color: AppColors.primaryOrange,
              ),
              rightStyle: AppTypography.text20.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.primaryOrange,
              ),
            ),
            const Divider(color: AppColors.dividerColor),
            const YBox(10),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Details',
                    style: AppTypography.text20.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const YBox(10),
                  const CustomColumnText(
                    upperText: 'Order Address',
                    lowerText:
                        '39 Ada George Road by Wimp Junction, off GRA Phase 4, Port Harcourt',
                  ),
                  const YBox(10),
                  const CustomColumnText(
                    upperText: 'Recipient',
                    lowerText: 'Precious Ruchi',
                  ),
                  const YBox(10),
                  const CustomColumnText(
                    upperText: 'Payment method',
                    lowerText: 'Mastercard ending in 3947',
                  ),
                  const YBox(24),
                  CustomBtn.solid(
                    text: "Proceed",
                    height: 53,
                    borderRadius: BorderRadius.circular(Sizer.radius(50)),
                    onTap: () {
                      //  Navigator.pushNamed(context, const ConfirmPaymentScreen());
                    },
                  ),
                  const YBox(16),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Shipping and return policies',
                      textAlign: TextAlign.center,
                      style: AppTypography.text12.copyWith(
                        color: AppColors.orange71,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const YBox(100),
          ],
        ),
      ),
    );
  }
}

class CustomColumnText extends StatelessWidget {
  const CustomColumnText({
    super.key,
    required this.upperText,
    required this.lowerText,
  });

  final String upperText;
  final String lowerText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          upperText,
          style: AppTypography.text12.copyWith(
            color: AppColors.textE70,
            fontWeight: FontWeight.w500,
          ),
        ),
        const YBox(4),
        Text(
          lowerText,
          style: AppTypography.text14.copyWith(
            color: AppColors.text28,
          ),
        ),
      ],
    );
  }
}

class CustomPaymentListTile extends StatelessWidget {
  const CustomPaymentListTile({
    super.key,
    required this.leftText,
    required this.rightText,
    this.leftStyle,
    this.rightStyle,
  });

  final String leftText;
  final String rightText;
  final TextStyle? leftStyle;
  final TextStyle? rightStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
        vertical: Sizer.height(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leftText,
            style: leftStyle ??
                AppTypography.text16.copyWith(
                  color: AppColors.text28,
                ),
          ),
          Text(
            rightText,
            style: rightStyle ??
                AppTypography.text16.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.text28,
                ),
          ),
        ],
      ),
    );
  }
}

class ConfirmPaymentProduct extends StatelessWidget {
  const ConfirmPaymentProduct({
    super.key,
    this.image,
    required this.name,
    this.onTap,
  });

  final String? image;
  final String name;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: Sizer.width(84),
        color: AppColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                Sizer.radius(8),
              ),
              child: imageHelper(
                image ?? AppImages.product2,
                height: Sizer.height(84),
                width: Sizer.width(84),
                fit: BoxFit.cover,
              ),
            ),
            const YBox(2),
            Container(
              // color: AppColors.red,
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(1),
              ),
              child: Text(
                name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTypography.text10.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
