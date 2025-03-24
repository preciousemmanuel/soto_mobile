import 'package:skeletonizer/skeletonizer.dart';
import 'package:soto_ecommerce/common/common.dart';

class ProductShimmer extends StatelessWidget {
  const ProductShimmer({
    super.key,
    this.count = 10,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      crossAxisSpacing: Sizer.width(20),
      mainAxisSpacing: Sizer.width(20),
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 0.64,
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
      ),
      children: [
        for (int i = 0; i < count; i++)
          const Skeletonizer(
            enabled: true,
            child: RelatedProductCard(
              productName: 'Gucci Product',
              productId: '2777378388ddbdbd',
              unitPrice: '1000',
              productImage:
                  'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
              onTap: null,
            ),
          ),
      ],
    );
  }
}
