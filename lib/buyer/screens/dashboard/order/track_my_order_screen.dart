import 'package:soto_ecommerce/common/common.dart';

class TrackMyOrderScreen extends StatelessWidget {
  const TrackMyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: CustomHeader(
        title: 'Track Order',
        backBtn: () {},
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        child: Column(
          children: [
            const YBox(30),
            const Row(
              children: [
                Expanded(child: CustomTimelIne()),
                Expanded(child: CustomTimelIne()),
                Expanded(child: CustomTimelIne(isCompleted: true)),
              ],
            ),
            const YBox(30),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(10),
                vertical: Sizer.height(10),
              ),
              decoration: BoxDecoration(
                color: AppColors.baseF9,
                borderRadius: BorderRadius.circular(Sizer.radius(10)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tracking ID',
                          style: AppTypography.text14.copyWith(
                            color: AppColors.text20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const YBox(4),
                        Text(
                          'TRNX-i38747388239390245',
                          style: AppTypography.text12.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const XBox(10),
                  svgHelper(AppSvgs.copy)
                ],
              ),
            ),
            const YBox(20),
            const TrackOrderCustomTextTile()
          ],
        ),
      ),
    );
  }
}

class TrackOrderCustomTextTile extends StatelessWidget {
  const TrackOrderCustomTextTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Packed',
              style: AppTypography.text14.copyWith(
                color: AppColors.text20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(8),
                vertical: Sizer.height(3),
              ),
              decoration: BoxDecoration(
                color: AppColors.baseF9,
                borderRadius: BorderRadius.circular(Sizer.radius(4)),
              ),
              child: Text(
                '20 Dec 2022',
                style: AppTypography.text12.copyWith(
                  color: AppColors.text66,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const YBox(2),
        Text(
          'Your parcel is packed and will be picked by our delivery partner soon.',
          style: AppTypography.text12.copyWith(
            color: AppColors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class CustomTimelIne extends StatelessWidget {
  const CustomTimelIne({
    super.key,
    this.isActive = false,
    this.isCompleted = false,
  });

  final bool isActive;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        svgHelper(AppSvgs.bulletActive),
        Expanded(
          child: Container(
            height: Sizer.height(8),
            color: AppColors.primaryOrange,
          ),
        ),
        if (isCompleted) svgHelper(AppSvgs.bulletActive),
      ],
    );
  }
}
