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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      init();
    });
  }

  init() {
    context.read<VendorProductVM>().getProductsByVendor();
  }

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
        return RefreshIndicator(
          onRefresh: () async {
            init();
          },
          child: ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              left: Sizer.width(20),
              right: Sizer.width(20),
              top: Sizer.height(40),
              bottom: Sizer.height(100),
            ),
            itemBuilder: (_, i) {
              return OverviewProductTile(
                product: ref.productsByVendor[i],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    RoutePath.vendorProductDetailsScreen,
                    arguments: ProductArgs(
                      productId: ref.productsByVendor[i].id ?? '',
                    ),
                  );
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(
              color: AppColors.whiteF7,
            ),
            itemCount: ref.productsByVendor.length,
          ),
        );
      }),
    );
  }
}
