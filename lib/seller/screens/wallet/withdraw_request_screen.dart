import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class WithdrawRequestScreen extends StatefulWidget {
  const WithdrawRequestScreen({super.key});

  @override
  State<WithdrawRequestScreen> createState() => _WithdrawRequestScreenState();
}

class _WithdrawRequestScreenState extends State<WithdrawRequestScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  _init() {
    context.read<WalletVm>().getWithdrawalRequests();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WalletVm>(
      builder: (context, ref, _) {
        return BusyOverlay(
          show: ref.isBusy,
          child: Scaffold(
            backgroundColor: AppColors.bgWhite,
            appBar: CustomHeader(
              title: 'Withdrawal Requests',
              titleWeight: FontWeight.w500,
              titleStyle: AppTypography.text16.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.text12,
              ),
            ),
            body: SafeArea(
              bottom: false,
              child: ListView(
                shrinkWrap: true,
                children: [
                  const YBox(20),
                  Builder(builder: (context) {
                    if (ref.withdrawRequestsList.isEmpty) {
                      return const EmptyListState(
                        text: 'No withdrawal requests yet',
                      );
                    }
                    return ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                        top: Sizer.height(10),
                        bottom: Sizer.height(100),
                      ),
                      children: ref.withdrawRequestsList.entries.map((e) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: Sizer.height(20),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Sizer.width(20),
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      e.key,
                                      style: AppTypography.text14.copyWith(
                                        color: AppColors.black33,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const YBox(5),
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, i) {
                                  final r = e.value[i];
                                  return WithdrawRequestTile(
                                    naration: 'Withdrawal Request',
                                    amount: (r.amount ?? 0.0).toString(),
                                    status: r.status ?? '',
                                    date: AppUtils.formatDateTime(
                                        (r.createdAt ?? DateTime.now())
                                            .toLocal()
                                            .toString()),
                                  );
                                },
                                separatorBuilder: (_, __) => const Divider(
                                  color: AppColors.dividerColor,
                                ),
                                itemCount: e.value.length,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    );
                  })
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // void getStatusColor(String status) {
  //   switch (status) {
  //     case 'pending':
  //       return AppColors.yellow;
  //     case 'approved':
  //       return AppColors.green;
  //     case 'rejected':
  //       return AppColors.red;
  //     default:
  //       return AppColors.black33;
  //   }
  // }
}
