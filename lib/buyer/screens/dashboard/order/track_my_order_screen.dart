import 'package:flutter/services.dart';
import 'package:soto_ecommerce/common/common.dart';

class TrackMyOrderScreen extends StatefulWidget {
  const TrackMyOrderScreen({
    super.key,
    required this.args,
  });

  final OrderDetailArg args;

  @override
  State<TrackMyOrderScreen> createState() => _TrackMyOrderScreenState();
}

class _TrackMyOrderScreenState extends State<TrackMyOrderScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderVM>().fetchOrderDetails(widget.args.orderId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderVM>(builder: (ctx, ref, _) {
      if (ref.isBusy) {
        return const SizerLoader();
      }
      return Scaffold(
        backgroundColor: AppColors.bgWhite,
        // appBar: const CustomHeader(
        //   title: 'Track Order',
        // ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(20),
          ),
          child: Column(
            children: [
              const YBox(30),
              Row(
                children: List.generate(
                  3,
                  (i) => Expanded(
                    child: CustomTimelIne(
                      isActive: i < ref.orderTrackSteps.length,
                      isCompleted: i == 2,
                    ),
                  ),
                ),
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
                            ref.singleOrder?.trackingId ?? '',
                            style: AppTypography.text12.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const XBox(10),
                    InkWell(
                      onTap: () async {
                        Clipboard.setData(ClipboardData(
                          text: ref.singleOrder?.trackingId ?? '',
                        )).then((_) {
                          FlushBarToast.fLSnackBar(
                            snackBarType: SnackBarType.success,
                            message: 'Tracking ID copied to clipboard',
                          );
                        });
                      },
                      child: svgHelper(AppSvgs.copy),
                    )
                  ],
                ),
              ),
              const YBox(40),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ref.orderTrackSteps.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return TrackOrderCustomTextTile(
                    text: ref.orderTrackSteps[index],
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}

class TrackOrderCustomTextTile extends StatelessWidget {
  const TrackOrderCustomTextTile({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(10),
        vertical: Sizer.height(10),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grayCC,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(Sizer.radius(10)),
      ),
      child: Row(
        children: [
          svgHelper(
            AppSvgs.bulletInactive,
            height: Sizer.height(16),
            width: Sizer.height(16),
          ),
          const XBox(10),
          Expanded(
            child: Text(
              text,
              style: AppTypography.text12.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
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
        svgHelper(isActive ? AppSvgs.bulletActive : AppSvgs.bulletInactive),
        Expanded(
          child: Container(
            height: Sizer.height(8),
            color: isActive ? AppColors.primaryOrange : AppColors.baseF9,
          ),
        ),
        if (isCompleted)
          svgHelper(isActive ? AppSvgs.bulletActive : AppSvgs.bulletInactive),
      ],
    );
  }
}
