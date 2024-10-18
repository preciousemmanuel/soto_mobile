import 'package:card_swiper/card_swiper.dart';
import 'package:soto_ecommerce/buyer/buyer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const YBox(10),
            const HomeNotificationHeader(),
            const YBox(26),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: CustomTextField(
                      hintText: 'I’m looking for...',
                      showfillColor: false,
                      borderColor: AppColors.grayDE,
                      prefixIcon: Icon(
                        Iconsax.search_normal_1,
                        color: AppColors.iconC4,
                        size: Sizer.height(20),
                      ),
                      showSuffixIcon: true,
                      suffixIcon: Container(
                        padding: const EdgeInsets.all(8),
                        child: svgHelper(AppSvgs.filter),
                      ),
                      // controller: vm.passwordC,
                      onChanged: (val) {},
                      onSubmitted: (p0) {},
                    ),
                  ),
                  const XBox(12),
                  Expanded(
                    flex: 3,
                    child: CustomBtn.withChild(
                      borderRadius: BorderRadius.circular(14),
                      online: true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Iconsax.edit_2,
                            size: Sizer.height(20),
                            color: AppColors.white,
                          ),
                          const XBox(8),
                          Text(
                            'Custom',
                            style: AppTypography.text12.copyWith(
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {
                        // RouterNav.push(context, const ShippingAddressScreen());
                      },
                    ),
                  ),
                ],
              ),
            ),
            const YBox(20),
            Homeheader(
              headerName: 'Categories',
              sellAllBtn: () {},
            ),
            const YBox(12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    5,
                    (i) => Container(
                      padding: EdgeInsets.only(
                        left: Sizer.width(12),
                        top: Sizer.height(18),
                      ),
                      margin: EdgeInsets.only(
                        right: Sizer.width(8),
                        left: i == 0 ? Sizer.width(20) : 0,
                      ),
                      width: Sizer.width(125),
                      height: Sizer.height(56),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizer.radius(8)),
                        image: const DecorationImage(
                            image: AssetImage(AppImages.cat)),
                      ),
                      child: Text(
                        'Furniture',
                        style: AppTypography.text12.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const YBox(26),
            SizedBox(
              height: Sizer.height(160),
              child: Swiper(
                autoplay: true,
                autoplayDisableOnInteraction: true,
                autoplayDelay: 5000,
                duration: 1000,
                itemBuilder: (BuildContext context, int i) {
                  return Container(
                    margin: EdgeInsets.only(
                      left: Sizer.width(20),
                      right: Sizer.width(20),
                    ),
                    decoration: BoxDecoration(
                      // color: AppColors.gray400,
                      borderRadius: BorderRadius.circular(Sizer.radius(8)),
                      image: const DecorationImage(
                        image: AssetImage(AppImages.banner),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                itemCount: 3,
                onIndexChanged: (index) {},
              ),
            ),
            const YBox(20),
            Homeheader(
              headerName: 'Popular',
              sellAllBtn: () {},
            ),
          ],
        ),
      ),
    );
  }
}
