import 'package:skeletonizer/skeletonizer.dart';
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
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(16),
              vertical: Sizer.height(30),
            ),
            itemBuilder: (_, i) {
              return const Skeletonizer(
                enabled: true,
                child: InventoryTable(
                  productName: 'Product Name',
                  date: 'Oct. 02, 2024',
                  deliveredTo: 'Vanessa',
                  unitPrce: '\$20,000',
                  qty: '270',
                ),
              );
            },
            separatorBuilder: (_, __) =>
                const Divider(color: AppColors.dividerColor),
            itemCount: 4,
          );
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
              ),
              const YBox(16),
              Builder(builder: (context) {
                if (ref.inventoryRecords.isEmpty) {
                  return const EmptyListState(
                    // height: 200,
                    text: 'No inventory records yet',
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, i) {
                    final iv = ref.inventoryRecords[i];
                    return InventoryTable(
                      productName: iv.productName ?? '',
                      date: iv.createdAt?.toIso8601String() ?? '',
                      deliveredTo:
                          '${iv.buyer?.firstName ?? ''} ${iv.buyer?.lastName ?? ''}',
                      unitPrce:
                          '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(iv.unitPrice.toString())}',
                      qty: '${iv.quantity ?? ''}',
                    );
                  },
                  separatorBuilder: (_, __) =>
                      const Divider(color: AppColors.dividerColor),
                  itemCount: ref.inventoryRecords.length,
                );
              })
            ],
          ),
        );
      },
    );
  }
}
