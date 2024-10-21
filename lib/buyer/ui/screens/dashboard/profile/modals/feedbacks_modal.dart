import 'package:soto_ecommerce/buyer/buyer.dart';

class FeedbacksModal extends StatelessWidget {
  const FeedbacksModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(20),
        vertical: Sizer.height(20),
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Sizer.radius(20)),
          topRight: Radius.circular(Sizer.radius(20)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: Sizer.height(8),
            width: Sizer.width(70),
            decoration: BoxDecoration(
              color: AppColors.grayD9,
              borderRadius: BorderRadius.circular(Sizer.radius(20)),
            ),
          ),
          const YBox(30),
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Name',
                      showLabelHeader: true,
                      fillColor: AppColors.transparent,
                      borderColor: AppColors.base9A,
                      hintText: 'Ruchi Precious',
                      onChanged: (val) {},
                    ),
                  ),
                  const XBox(40),
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Contact Number',
                      showLabelHeader: true,
                      fillColor: AppColors.transparent,
                      borderColor: AppColors.base9A,
                      hintText: '+234 80300 00000',
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
              const YBox(16),
              CustomTextField(
                labelText: 'Email address',
                showLabelHeader: true,
                fillColor: AppColors.transparent,
                borderColor: AppColors.base9A,
                hintText: 'ruchi_presh@gmail.com',
                onChanged: (val) {},
              ),
              const YBox(80),
              CustomTextField(
                maxLines: 3,
                fillColor: AppColors.transparent,
                borderColor: AppColors.base9A,
                hintText: 'Add your comments...',
                onChanged: (val) {},
              ),
              const YBox(30),
              CustomBtn.solid(
                onTap: () {},
                height: 50,
                borderRadius: BorderRadius.circular(Sizer.radius(100)),
                text: "Submit",
              ),
            ],
          ),
          const YBox(40),
        ],
      ),
    );
  }
}
