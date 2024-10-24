import 'package:soto_ecommerce/buyer/buyer.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      body: SizedBox(
        width: Sizer.screenWidth,
        height: Sizer.screenHeight,
        child: SafeArea(
          bottom: false,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(
              horizontal: Sizer.width(20),
            ),
            children: [
              const YBox(20),
              const CustomHeader(
                title: 'Create Order',
                color: AppColors.primaryOrange,
              ),
              const YBox(4),
              Text(
                'Kindly enter your order details',
                textAlign: TextAlign.center,
                style: AppTypography.text12.copyWith(
                  color: AppColors.text56,
                ),
              ),
              const YBox(24),
              CustomTextField(
                labelText: 'Product name',
                showLabelHeader: true,
                fillColor: AppColors.bgF5,
                hintText: 'Enter name',
                onChanged: (val) {},
              ),
              const YBox(20),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Product Brand',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'Enter brand',
                      onChanged: (val) {},
                    ),
                  ),
                  const XBox(24),
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Size ',
                      optionalText: '(if applicable)',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'Enter size',
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
              const YBox(20),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Color',
                      optionalText: '(if applicable)',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'Enter color',
                      onChanged: (val) {},
                    ),
                  ),
                  const XBox(24),
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Type ',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'Enter type',
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
              const YBox(20),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Quantity',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'Enter quantity',
                      onChanged: (val) {},
                    ),
                  ),
                  const XBox(24),
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Type ',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'Enter type',
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
              const YBox(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: 'Price Range',
                      showLabelHeader: true,
                      fillColor: AppColors.bgF5,
                      hintText: 'Minimum',
                      onChanged: (val) {},
                    ),
                  ),
                  const XBox(24),
                  Expanded(
                    child: CustomTextField(
                      fillColor: AppColors.bgF5,
                      hintText: 'Maximum',
                      onChanged: (val) {},
                    ),
                  ),
                ],
              ),
              const YBox(20),
              CustomTextField(
                labelText: 'Message',
                showLabelHeader: true,
                fillColor: AppColors.bgF5,
                hintText: 'Leave a note...',
                maxLines: 3,
                onChanged: (val) {},
              ),
              const YBox(25),
              Row(children: [
                Expanded(
                  child: CustomBtn.solid(
                    height: Sizer.height(50),
                    onTap: () {
                      Navigator.pushNamed(context, RoutePath.addOrderScreen);
                    },
                    text: "Save & Submit",
                  ),
                ),
                const XBox(20),
                Expanded(
                  child: CustomBtn.solid(
                    isOutline: true,
                    height: Sizer.height(50),
                    text: "Save & Add",
                    textColor: AppColors.primaryOrange,
                    onTap: () {
                      Navigator.pushNamed(context, RoutePath.addOrderScreen);
                    },
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
