import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class InventoryTab extends StatefulWidget {
  const InventoryTab({
    super.key,
  });

  @override
  State<InventoryTab> createState() => _InventoryTabState();
}

class _InventoryTabState extends State<InventoryTab> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<VendorDashboardVM>().getVendorInventory();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VendorDashboardVM>(
      builder: (context, ref, _) {
        if (ref.busy(vendorInventoryState)) {
          return const SizerLoader(height: 500);
        }
        return Expanded(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
            ),
            children: [
              const YBox(24),
              Row(
                children: [
                  Expanded(
                    child: InventoryStat(
                      name: 'Total Products',
                      quantity: AppUtils.formatAmountString(
                        (ref.vendorInventory?.totalProducts ?? 0).toString(),
                      ),
                    ),
                  ),
                  const XBox(20),
                  Expanded(
                    child: InventoryStat(
                      name: 'Total Sold',
                      quantity: AppUtils.formatAmountString(
                        (ref.vendorInventory?.totalSold ?? 0).toString(),
                      ),
                    ),
                  ),
                  const XBox(20),
                  Expanded(
                    child: InventoryStat(
                      name: 'Total In stock',
                      quantity: AppUtils.formatAmountString(
                        (ref.vendorInventory?.totalInStock ?? 0).toString(),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
