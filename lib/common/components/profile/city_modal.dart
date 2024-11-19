import 'package:soto_ecommerce/common/common.dart';

class CityModal extends StatefulWidget {
  const CityModal({
    super.key,
    this.cityNamel,
    this.stateModel,
  });

  final String? cityNamel;
  final StateModel? stateModel;

  @override
  State<CityModal> createState() => _CityModalState();
}

class _CityModalState extends State<CityModal> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthUserVM>().getCities(
            stateCode: widget.stateModel?.isoCode ?? '',
            countryCode: widget.stateModel?.countryCode ?? '',
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthUserVM>(builder: (context, ref, _) {
      return Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: Sizer.width(20),
          right: Sizer.width(20),
          top: Sizer.height(20),
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Sizer.radius(20)),
            topRight: Radius.circular(Sizer.radius(20)),
          ),
        ),
        child: SizedBox(
          height: Sizer.screenHeight * 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List of Cities',
                style: AppTypography.text16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Builder(builder: (context) {
                if (ref.isBusy) {
                  return const SizerLoader(
                    height: 300,
                  );
                }
                if (ref.states.isEmpty) {
                  return const EmptyListState(
                    height: 300,
                    text: 'No cities found',
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.only(
                      top: Sizer.height(20),
                      bottom: 80,
                    ),
                    itemBuilder: (_, i) {
                      return CustomStateTile(
                          title: ref.cities[i].name ?? '',
                          isSelected: ref.cities[i].name == widget.cityNamel,
                          onTap: () {
                            Navigator.pop(context, ref.cities[i].name);
                          });
                    },
                    separatorBuilder: (_, __) => const YBox(10),
                    itemCount: ref.cities.length,
                  ),
                );
              }),
            ],
          ),
        ),
      );
    });
  }
}
