import 'package:soto_ecommerce/common/common.dart';

class RaiseDisputeScreen extends StatefulWidget {
  const RaiseDisputeScreen({super.key});

  @override
  State<RaiseDisputeScreen> createState() => _RaiseDisputeScreenState();
}

class _RaiseDisputeScreenState extends State<RaiseDisputeScreen> {
  final titleC = TextEditingController();
  final descC = TextEditingController();
  final titleF = FocusNode();
  final descF = FocusNode();

  bool isExpanded = false;

  List<String> disputeTitles = [
    'Order and Delivery',
    'Payment and Refund ',
    'Product quality and authenticity',
    'Warranty and Returns',
    'Fraud and security',
  ];

  @override
  void dispose() {
    titleC.dispose();
    descC.dispose();
    titleF.dispose();
    descF.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DisputeVm>(builder: (ctx, vm, _) {
      return BusyOverlay(
        show: vm.isBusy,
        child: Scaffold(
          backgroundColor: AppColors.bgWhite,
          appBar: CustomHeader(
            title: 'Raise Dispute',
            titleWeight: FontWeight.w500,
            titleStyle: AppTypography.text16.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.text12,
            ),
            backBtn: () {
              vm.clearDisputeImages();
              Navigator.pop(context);
            },
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const YBox(30),
              Text(
                'Kindly input your dispute title and let us know your complaint',
                style: AppTypography.text12.copyWith(),
              ),
              const YBox(40),

              // CustomTextField(
              //   controller: titleC,
              //   focusNode: titleF,
              //   fillColor: AppColors.transparent,
              //   borderColor: AppColors.base9A,
              //   isReadOnly: true,
              //   borderRadius: 5,
              //   hintText: 'Dispute Title',
              //   onChanged: (val) => vm.reBuildUI(),
              //   onTap: ,
              // ),

              SelectCategoryField(
                text: titleC.text.trim().isNotEmpty ? titleC.text : 'Title',
                borderColor: AppColors.base9A,
                bgColor: AppColors.transparent,
                showLeadingIcon: false,
                isExpanded: isExpanded,
                isLoading: vm.isBusy,
                hasBeenSelected: titleC.text.isNotEmpty,
                onSelect: () {
                  isExpanded = !isExpanded;
                  vm.reBuildUI();
                },
                children: List.generate(
                  disputeTitles.length,
                  (i) {
                    return InkWell(
                      onTap: () {
                        isExpanded = false;
                        titleC.text = disputeTitles[i];
                        vm.reBuildUI();
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Sizer.height(i == 0 ? 30 : 14),
                          bottom: Sizer.height(
                              i == disputeTitles.length - 1 ? 0 : 14),
                        ),
                        child: Text(
                          disputeTitles[i],
                          style: AppTypography.text14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.text57,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const YBox(30),
              CustomTextField(
                controller: descC,
                focusNode: descF,
                fillColor: AppColors.transparent,
                borderColor: AppColors.base9A,
                borderRadius: 5,
                maxLines: 5,
                hintText: 'Type your complaint',
                onChanged: (val) => vm.reBuildUI(),
              ),
              const YBox(30),
              InkWell(
                onTap: () {
                  vm.pickImage();
                },
                child: Row(
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
              ),
              vm.disputeImages.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        vertical: Sizer.height(20),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizer.width(12),
                        vertical: Sizer.height(30),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.grayE0,
                        ),
                        borderRadius: BorderRadius.circular(Sizer.height(14)),
                      ),
                      child: Center(
                        child: Wrap(
                          spacing: Sizer.width(15),
                          runSpacing: Sizer.height(10),
                          children: List.generate(
                            vm.disputeImages.length,
                            (i) => Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.grayE0),
                                    borderRadius:
                                        BorderRadius.circular(Sizer.height(8)),
                                  ),
                                  height: Sizer.height(80),
                                  width: Sizer.width(80),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(Sizer.height(8)),
                                    child: Image.file(
                                      vm.disputeImages[i],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -8,
                                  right: -8,
                                  child: InkWell(
                                    onTap: () {
                                      vm.removeDisputeImage(i);
                                    },
                                    child: const Icon(
                                      Iconsax.close_circle,
                                      color: AppColors.red,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : const YBox(150),
              CustomBtn.solid(
                online: titleC.text.isNotEmpty && descC.text.isNotEmpty,
                onTap: _raiseDispute,
                text: "Raise Dispute",
              ),
              const YBox(28),
              CustomBtn.solid(
                isOutline: true,
                height: Sizer.height(50),
                text: "Back to Home",
                textColor: AppColors.primaryOrange,
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, RoutePath.dashboardNavScreen, (route) => false);
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  void _raiseDispute() async {
    final vm = context.read<DisputeVm>();
    final res = await vm.raiseDispute(
      title: titleC.text.trim(),
      description: descC.text.trim(),
    );

    handleApiResponse(
      response: res,
      onSuccess: () {
        vm.clearDisputeImages();
        Navigator.pushNamed(
          context,
          RoutePath.disputeConfirmScreen,
          arguments: DisputeArgs(disputeId: res.data?['data']['code']),
        );
      },
    );
  }
}
