import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vendor_product_vm.dart';

class VendorProductListScreen extends StatelessWidget {
  const VendorProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgFF,
      appBar: CustomHeader(
        title: 'Product List',
        titleWeight: FontWeight.w500,
        titleStyle: AppTypography.text16.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.text1A,
        ),
      ),
      body: Consumer<VendorProductVM>(builder: (context, ref, _) {
        if (ref.isBusy) {
          return const SizerLoader(
            height: 500,
          );
        }
        if (ref.productsByVendor.isEmpty) {
          return const EmptyListState(
            height: 500,
            text: 'No products found',
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(
            left: Sizer.width(20),
            right: Sizer.width(20),
            top: Sizer.height(40),
            bottom: Sizer.height(100),
          ),
          itemBuilder: (_, i) {
            return OverviewProductTile(
              product: ref.productsByVendor[i],
            );
          },
          separatorBuilder: (_, __) => const Divider(
            color: AppColors.whiteF7,
          ),
          itemCount: ref.productsByVendor.length,
        );
      }),
    );
  }
}
