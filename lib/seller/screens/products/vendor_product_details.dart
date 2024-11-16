import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vendor_product_vm.dart';

class VendorProductListScreen extends StatefulWidget {
  const VendorProductListScreen({super.key});

  @override
  State<VendorProductListScreen> createState() =>
      _VendorProductListScreenState();
}

class _VendorProductListScreenState extends State<VendorProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VendorProductVM>(builder: (context, ref, _) {
      return Scaffold(
          backgroundColor: AppColors.bgFF,
          appBar: CustomHeader(
            title: 'Product Details',
            titleWeight: FontWeight.w500,
            titleStyle: AppTypography.text16.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.text1A,
            ),
          ),
          body: ListView(
            children: const [
              // SizedBox(
              //   height: Sizer.height(340),
              //   width: Sizer.screenWidth,
              //   child: MyCachedNetworkImage(
              //     imageUrl: (_singleProduct?.images?.isNotEmpty ?? false)
              //         ? (_singleProduct?.images?.first ?? '')
              //         : '',
              //     fadeInDuration: const Duration(milliseconds: 50),
              //     // fit: BoxFit.cover,
              //     width: MediaQuery.of(context).size.width,
              //     height: Sizer.height(160),
              //   ),
              // ),
            ],
          ));
    });
  }
}
