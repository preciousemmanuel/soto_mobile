import 'package:soto_ecommerce/common/common.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgFB,
      appBar: const CustomHeader(
        title: 'Payment',
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        children: [
          const YBox(30),
          imageHelper(
            AppImages.creditCard,
            height: Sizer.height(200),
          ),
          const YBox(40),
          CustomTextField(
            fillColor: AppColors.bgF5,
            hintText: 'Card Holder Name',
            // prefixIcon: Icon(
            //   Iconsax.sms,
            //   color: AppColors.iconC4,
            //   size: Sizer.height(20),
            // ),
            onChanged: (val) {},
          ),
          const YBox(24),
          CustomTextField(
            fillColor: AppColors.bgF5,
            hintText: 'Card number',
            // prefixIcon: Icon(
            //   Iconsax.sms,
            //   color: AppColors.iconC4,
            //   size: Sizer.height(20),
            // ),
            onChanged: (val) {},
          ),
          const YBox(24),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  fillColor: AppColors.bgF5,
                  hintText: 'MM',
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.iconC4,
                    size: Sizer.height(20),
                  ),
                  onChanged: (val) {},
                ),
              ),
              const XBox(50),
              Expanded(
                child: CustomTextField(
                  fillColor: AppColors.bgF5,
                  hintText: 'YY',
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.iconC4,
                    size: Sizer.height(20),
                  ),
                  onChanged: (val) {},
                ),
              ),
            ],
          ),
          const YBox(24),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  fillColor: AppColors.bgF5,
                  hintText: 'CVV',
                  onChanged: (val) {},
                ),
              ),
              const XBox(50),
              Expanded(
                  child: Container(
                child: Text(
                  '3 digits usually \nfound at the back \nside',
                  style: AppTypography.text12.copyWith(
                    color: AppColors.text5C,
                    height: 1.2,
                  ),
                ),
              )),
            ],
          ),
          const YBox(100),
        ],
      ),
      bottomSheet: Container(
        padding: EdgeInsets.only(
          left: Sizer.width(20),
          right: Sizer.width(20),
          bottom: Sizer.height(30),
          top: Sizer.height(10),
        ),
        // height: Sizer.height(92),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(
              color: AppColors.grayDE,
              width: 2,
            ),
          ),
        ),
        child: CustomBtn.solid(
          text: "Add Card",
          height: 53,
          borderRadius: BorderRadius.circular(Sizer.radius(50)),
          onTap: () {
            Navigator.pushNamed(context, RoutePath.confirmPaymentScreen);
          },
        ),
      ),
    );
  }
}
