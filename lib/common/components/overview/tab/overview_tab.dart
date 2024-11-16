import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vendor_product_vm.dart';

class OverviewTab extends StatefulWidget {
  const OverviewTab({
    super.key,
  });

  @override
  State<OverviewTab> createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VendorProductVM>().getProductsByVendor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        children: [
          const YBox(24),
          const Row(
            children: [
              Expanded(child: OverViewStat()),
              XBox(10),
              Expanded(child: OverViewStat()),
            ],
          ),
          const YBox(24),
          Container(
            height: Sizer.height(176),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grayE8,
                ),
                borderRadius: BorderRadius.circular(
                  Sizer.radius(6),
                )),
            child: Center(
              child: Text(
                'Income stats',
                style: AppTypography.text14.copyWith(
                  color: AppColors.text57,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const YBox(20),
          Homeheader(
            headerName: 'Products',
            addPadding: false,
            headerFontSize: Sizer.text(16),
            sellAllBtn: () {
              Navigator.pushNamed(context, RoutePath.vendorProductListScreen);
            },
          ),
          const YBox(16),
          Consumer<VendorProductVM>(builder: (context, ref, _) {
            if (ref.isBusy) {
              return const SizerLoader();
            }
            if (ref.productsByVendor.isEmpty) {
              return const EmptyListState(
                height: 200,
                text: 'No products found',
              );
            }
            return ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
          const YBox(100),
        ],
      ),
    );
  }
}
