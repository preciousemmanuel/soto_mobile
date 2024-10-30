import 'package:soto_ecommerce/common/common.dart';

class OverviewTab extends StatelessWidget {
  const OverviewTab({
    super.key,
  });

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
            sellAllBtn: () {},
          ),
          const YBox(16),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, __) {
              return const OverviewProductTile();
            },
            separatorBuilder: (_, __) => const Divider(
              color: AppColors.whiteF7,
            ),
            itemCount: 6,
          ),
          const YBox(100),
        ],
      ),
    );
  }
}
