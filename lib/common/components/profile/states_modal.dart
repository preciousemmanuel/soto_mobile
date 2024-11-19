import 'package:soto_ecommerce/common/common.dart';

class StatesModal extends StatefulWidget {
  const StatesModal({
    super.key,
    this.stateNamel,
  });

  final String? stateNamel;

  @override
  State<StatesModal> createState() => _StatesModalState();
}

class _StatesModalState extends State<StatesModal> {
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
                'List of States',
                style: AppTypography.text16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Builder(builder: (context) {
                if (ref.states.isEmpty) {
                  return const EmptyListState(
                    text: 'No states found',
                    height: 200,
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
                          title: ref.states[i].name ?? '',
                          isSelected: ref.states[i].name == widget.stateNamel,
                          onTap: () {
                            Navigator.pop(context, ref.states[i]);
                          });
                    },
                    separatorBuilder: (_, __) => const YBox(10),
                    itemCount: ref.states.length,
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
