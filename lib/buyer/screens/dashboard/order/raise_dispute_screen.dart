import 'package:soto_ecommerce/common/common.dart';

class RaiseDisputeScreen extends StatelessWidget {
  const RaiseDisputeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: CustomHeader(
        title: 'Raise Dispute',
        titleWeight: FontWeight.w500,
        titleStyle: AppTypography.text16.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.text12,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const YBox(30),
          Text('Kindly input your dispute title and let us know your complaint',
              style: AppTypography.text12.copyWith()),
          const YBox(40),
          CustomTextField(
            fillColor: AppColors.transparent,
            borderColor: AppColors.base9A,
            borderRadius: 5,
            hintText: 'Dispute Title',
            onChanged: (val) {},
          ),
          const YBox(30),
          CustomTextField(
            fillColor: AppColors.transparent,
            borderColor: AppColors.base9A,
            borderRadius: 5,
            maxLines: 5,
            hintText: 'Type your complaint',
            onChanged: (val) {},
          ),
          const YBox(30),
          Row(
            children: [
              Container(
                height: Sizer.height(42),
                width: Sizer.width(42),
                decoration: BoxDecoration(
                    color: AppColors.primaryOrange.withOpacity(0.2)),
                child: svgHelper(
                  AppSvgs.attach,
                  height: Sizer.height(13),
                  width: Sizer.width(13),
                  fit: BoxFit.none,
                ),
              ),
              const XBox(10),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Attach Photo ',
                      style: AppTypography.text12.copyWith(
                        color: AppColors.black.withOpacity(0.5),
                      ),
                    ),
                    TextSpan(
                      text: '(Optional)',
                      style: AppTypography.text12.copyWith(
                        color: AppColors.primaryOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const YBox(150),
          CustomBtn.solid(
            // online: vm.btnIsValid,
            onTap: () {
              Navigator.pushNamed(context, RoutePath.raiseDisputeScreen);
            },
            text: "Raise Dispute",
          ),
          const YBox(28),
          CustomBtn.solid(
            isOutline: true,
            height: Sizer.height(50),
            text: "Back to Home",
            textColor: AppColors.primaryOrange,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
