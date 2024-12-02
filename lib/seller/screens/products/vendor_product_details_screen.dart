import 'package:google_fonts/google_fonts.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vendor_product_vm.dart';

class VendorProductDetailsScreen extends StatefulWidget {
  const VendorProductDetailsScreen({
    super.key,
    required this.args,
  });

  final ProductArgs args;

  @override
  State<VendorProductDetailsScreen> createState() =>
      _VendorProductDetailsScreenState();
}

class _VendorProductDetailsScreenState
    extends State<VendorProductDetailsScreen> {
  Product? _singleProduct;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context
          .read<VendorProductVM>()
          .fetchSingleProduct(productId: widget.args.productId)
          .then((v) {
        _singleProduct = v.data;
        setState(() {});
      });
    });
  }

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
        body: Builder(builder: (context) {
          if (ref.isBusy) {
            return const SizerLoader(
              height: 500,
            );
          }
          return ListView(
            // shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
            ),
            children: [
              const YBox(26),
              Container(
                height: Sizer.height(160),
                width: Sizer.screenWidth,
                color: AppColors.bgFF,
                child: MyCachedNetworkImage(
                  imageUrl: (_singleProduct?.images?.isNotEmpty ?? false)
                      ? (_singleProduct?.images?.first ?? '')
                      : '',
                  fadeInDuration: const Duration(milliseconds: 50),
                  fit: BoxFit.cover,
                ),
              ),
              const YBox(12),
              if ((_singleProduct?.images?.isNotEmpty == true &&
                  {_singleProduct?.images ?? []}.contains('https://')))
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Wrap(
                      spacing: Sizer.width(15),
                      runSpacing: Sizer.height(10),
                      children: List.generate(
                        _singleProduct?.images?.length ?? 0,
                        (i) => Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Sizer.height(8)),
                          ),
                          height: Sizer.height(90),
                          width: Sizer.width(100),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(Sizer.height(8)),
                            child: Image.network(
                              _singleProduct?.images?[i] ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              const YBox(20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _singleProduct?.productName ?? '',
                          style: AppTypography.text16.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.text3E,
                          ),
                        ),
                        const YBox(4),
                        Text(
                          '${AppUtils.nairaSymbol}${AppUtils.formatAmountString(_singleProduct?.unitPrice.toString() ?? '')}',
                          style: GoogleFonts.roboto(
                            color: AppColors.primaryOrange,
                            fontSize: Sizer.height(24),
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  if ((_singleProduct?.category?.name ?? '').isNotEmpty)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizer.width(12),
                        vertical: Sizer.height(4),
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(Sizer.radius(8)),
                      ),
                      child: Text(
                        _singleProduct?.category?.name ?? '',
                        style: AppTypography.text14.copyWith(
                            color: AppColors.primaryOrange,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                ],
              ),
              const YBox(13),
              Text('Description', style: AppTypography.text14),
              Text(
                "I recently purchased the Avery Sofa and Armchair from E&M Furnitures, and I couldn't be happier! The quality of the materials and craftsmanship is top-notch and the delivery team was professional, ensuring everything was perfectly assembled.",
                style: AppTypography.text12.copyWith(
                  color: AppColors.textAA,
                ),
              ),
              const YBox(13),
              Text('Rating', style: AppTypography.text14),
              const ProductReviewStat(),
              const YBox(13),
              Text('Product in stock', style: AppTypography.text14),
              const YBox(4),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Qty: ',
                  style: AppTypography.text14.copyWith(
                    color: AppColors.text3E,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(
                  text: AppUtils.formatAmountString(
                      _singleProduct?.productQuantity.toString() ?? ''),
                  style: AppTypography.text14.copyWith(
                    color: AppColors.primaryOrange,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ])),
              const YBox(13),
              // CustomBtn.solid(
              //   onTap: () {},
              //   text: "Login",
              // ),
            ],
          );
        }),
      );
    });
  }
}
