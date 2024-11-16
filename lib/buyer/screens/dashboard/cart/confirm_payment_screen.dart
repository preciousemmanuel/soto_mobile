// ignore_for_file: use_build_context_synchronously

import 'package:soto_ecommerce/buyer/screens/confirmation/confirmation_screen.dart';
import 'package:soto_ecommerce/common/common.dart';

class ConfirmPaymentScreen extends StatefulWidget {
  const ConfirmPaymentScreen({super.key});

  @override
  State<ConfirmPaymentScreen> createState() => _ConfirmPaymentScreenState();
}

class _ConfirmPaymentScreenState extends State<ConfirmPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthUserVM>(
      builder: (context, authVM, _) {
        return Scaffold(
          backgroundColor: AppColors.bgFB,
          appBar: const CustomHeader(
            title: 'Confirm Payment',
          ),
          body: ListView(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: [
              const YBox(30),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizer.width(20),
                ),
                child: Wrap(
                  spacing: 30,
                  runSpacing: 20,
                  children: authVM.cart?.items
                          ?.map((item) => ConfirmPaymentProduct(
                                image: item.images?.isNotEmpty ?? false
                                    ? item.images?.first
                                    : '',
                                name: item.productName ?? '',
                                onTap: () {},
                              ))
                          .toList() ??
                      [],
                ),
              ),
              const YBox(10),
              const Divider(color: AppColors.dividerColor),
              CustomPaymentListTile(
                leftText: 'Number of items',
                rightText: '${authVM.cart?.items?.length ?? 0}',
              ),
              CustomPaymentListTile(
                leftText: 'Total Amount',
                rightText:
                    '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(authVM.cart?.totalAmount.toString() ?? '0.00')}',
              ),
              const CustomPaymentListTile(
                leftText: 'Vats',
                rightText: 'N200',
              ),
              CustomPaymentListTile(
                leftText: 'Shipping',
                rightText:
                    '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(authVM.cart?.deliveryAmount.toString() ?? '0.00')}',
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
                rightText:
                    '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(authVM.cart?.totalAmount.toString() ?? '0.00')}',
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
                    CustomColumnText(
                      upperText: 'Order Address',
                      lowerText: authVM.shippingADD,
                    ),
                    const YBox(10),
                    CustomColumnText(
                      upperText: 'Recipient',
                      lowerText: authVM.fullname,
                    ),
                    const YBox(10),
                    const CustomColumnText(
                      upperText: 'Payment method',
                      lowerText: 'Mastercard ending in 3947',
                    ),
                    const YBox(24),
                    Consumer<OrderVM>(builder: (context, orderVM, _) {
                      return CustomBtn.solid(
                        text: "Proceed",
                        isLoading: orderVM.isBusy,
                        height: 53,
                        borderRadius: BorderRadius.circular(Sizer.radius(50)),
                        onTap: () => _createOrder(),
                      );
                    }),
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
        );
      },
    );
  }

  void _createOrder() {
    final orderVM = context.read<OrderVM>();
    final authVM = context.read<AuthUserVM>();

    List<ProductCart> items = [];
    for (Item item in authVM.cart?.items ?? []) {
      items.add(ProductCart(
        productId: item.productId ?? '',
        qty: item.quantity ?? 0,
      ));
    }
    orderVM
        .createOder(
      items: items,
      address: authVM.shippingADD,
    )
        .then((val) {
      if (val.success) {
        authVM.getUserProfile();
        FlushBarToast.fLSnackBar(
          snackBarType: SnackBarType.success,
          message: val.message ?? 'Order created successfully',
        );
        Navigator.pushReplacementNamed(context, RoutePath.confirmationScreen,
            arguments: ConfirmationScreenArgs(
              msg: val.message ?? 'Order created \nsuccessfully',
            ));
      } else {
        FlushBarToast.fLSnackBar(
          message: val.message ?? "Something went wrong",
        );
      }
    });
  }
}
