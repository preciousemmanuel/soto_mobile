import 'package:soto_ecommerce/buyer/buyer.dart';

class ShippingAddressModal extends StatelessWidget {
  const ShippingAddressModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizer.radius(20)),
          topRight: Radius.circular(Sizer.radius(20)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
              vertical: Sizer.height(10),
            ),
            decoration: BoxDecoration(
              color: AppColors.whiteF7,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Sizer.radius(20)),
                topRight: Radius.circular(Sizer.radius(20)),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Shipping Address",
                  style: AppTypography.text20.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const YBox(16),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(30),
            ),
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Country',
                      style: AppTypography.text14.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YBox(2),
                    Row(
                      children: [
                        Text(
                          'Nigeria',
                          style: AppTypography.text20.copyWith(
                            color: AppColors.textAF,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.chevron_right,
                          color: AppColors.textAF,
                        ),
                      ],
                    )
                  ],
                ),
                const YBox(16),
                CustomTextField(
                  labelText: 'Address',
                  showLabelHeader: true,
                  hintText: 'Enter your address',
                  onChanged: (val) {},
                ),
                const YBox(16),
                CustomTextField(
                  labelText: 'Town / City',
                  showLabelHeader: true,
                  hintText: 'Port Harcourt',
                  onChanged: (val) {},
                ),
                const YBox(16),
                CustomTextField(
                  labelText: 'Postcode',
                  showLabelHeader: true,
                  hintText: '00000',
                  onChanged: (val) {},
                ),
                const YBox(30),
                CustomBtn.solid(
                  onTap: () {},
                  height: 50,
                  borderRadius: BorderRadius.circular(Sizer.radius(100)),
                  text: "Save Changes",
                ),
              ],
            ),
          ),
          const YBox(40),
        ],
      ),
    );
  }
}
