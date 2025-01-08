import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

class CreateBusinessAccountScreen extends StatefulWidget {
  const CreateBusinessAccountScreen({super.key});

  @override
  State<CreateBusinessAccountScreen> createState() =>
      _CreateBusinessAccountScreenState();
}

class _CreateBusinessAccountScreenState
    extends State<CreateBusinessAccountScreen> {
  FocusNode businessNameF = FocusNode();
  FocusNode businessEmailF = FocusNode();
  FocusNode businessPhoneF = FocusNode();
  FocusNode businessAddressF = FocusNode();
  FocusNode descriptionF = FocusNode();

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CreateBusinessVM>().getVendorCategories();
    });
  }

  @override
  void dispose() {
    businessNameF.dispose();
    businessEmailF.dispose();
    businessPhoneF.dispose();
    businessAddressF.dispose();
    descriptionF.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CreateBusinessVM>(builder: (context, vm, _) {
      return Scaffold(
        backgroundColor: AppColors.bgFF,
        appBar: CustomHeader(
          title: 'Business Details',
          titleStyle: AppTypography.text20.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.text12,
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Sizer.width(20),
          ),
          child: ListView(
            children: [
              Text(
                'Kindly add your business information \nto create an account',
                textAlign: TextAlign.center,
                style: AppTypography.text12.copyWith(
                  color: AppColors.text7D,
                ),
              ),
              const YBox(20),
              CustomTextField(
                focusNode: businessNameF,
                labelText: "Business Name",
                showLabelHeader: true,
                fillColor: AppColors.orangeEA.withOpacity(0.5),
                hintText: 'Business Name',
                controller: vm.businessNameC,
                prefixIcon: Icon(
                  Iconsax.user,
                  color: AppColors.iconC4,
                  size: Sizer.height(20),
                ),
                onChanged: (val) => vm.reBuildUI(),
              ),
              const YBox(20),
              CustomTextField(
                  focusNode: businessEmailF,
                  labelText: "Business Email Address",
                  showLabelHeader: true,
                  fillColor: AppColors.orangeEA.withOpacity(0.5),
                  hintText: 'Enter Email Address',
                  controller: vm.businessEmailC,
                  errorText: vm.isValidEmail == false &&
                          vm.businessEmailC.text.isNotEmpty
                      ? 'Invalid Email Address'
                      : null,
                  prefixIcon: Icon(
                    Iconsax.sms,
                    color: AppColors.iconC4,
                    size: Sizer.height(20),
                  ),
                  onChanged: (val) {
                    vm.emailIsValid();
                  }),
              const YBox(20),
              CustomTextField(
                focusNode: businessPhoneF,
                labelText: "Phone Number",
                showLabelHeader: true,
                fillColor: AppColors.orangeEA.withOpacity(0.5),
                hintText: 'Enter Phone Number',
                controller: vm.businessPhoneC,
                errorText: vm.businessPhoneC.text.isNotEmpty &&
                        vm.businessPhoneC.text.length < 11
                    ? 'Phone Number must be at least 11 characters'
                    : null,
                prefixIcon: Icon(
                  Iconsax.call,
                  color: AppColors.iconC4,
                  size: Sizer.height(20),
                ),
                onChanged: (val) => vm.reBuildUI(),
              ),
              const YBox(20),
              CustomTextField(
                focusNode: businessAddressF,
                labelText: "Business Address",
                showLabelHeader: true,
                fillColor: AppColors.orangeEA.withOpacity(0.5),
                hintText: 'Enter Address',
                controller: vm.businessAddressC,
                prefixIcon: Icon(
                  Iconsax.location,
                  color: AppColors.iconC4,
                  size: Sizer.height(20),
                ),
                onChanged: (val) => vm.reBuildUI(),
              ),
              const YBox(20),
              Text(
                'Business Categpry',
                style: TextStyle(
                  color: AppColors.text5C,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YBox(6),
              SelectCategoryField(
                text: vm.businessCategoryC.text.isEmpty
                    ? 'Select Category'
                    : vm.businessCategoryC.text,
                isExpanded: isExpanded,
                isLoading: vm.isBusy,
                hasBeenSelected: vm.businessCategoryC.text.isNotEmpty,
                onSelect: () {
                  isExpanded = !isExpanded;
                  vm.reBuildUI();
                },
                children: List.generate(
                  vm.productCategories.length,
                  (i) {
                    return InkWell(
                      onTap: () {
                        vm.setCategoryId(vm.productCategories[i].id ?? '');
                        vm.businessCategoryC.text =
                            vm.productCategories[i].name ?? '';
                        isExpanded = false;
                        vm.reBuildUI();
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Sizer.height(i == 0 ? 30 : 14),
                          bottom: Sizer.height(
                              i == vm.productCategories.length - 1 ? 0 : 14),
                        ),
                        child: Text(
                          vm.productCategories[i].name ?? '',
                          style: AppTypography.text14.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.text57,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const YBox(20),
              Text(
                'Description',
                style: TextStyle(
                  color: AppColors.text5C,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Add description to make your profile look great',
                style: AppTypography.text12.copyWith(
                  color: AppColors.text7D,
                ),
              ),
              const YBox(6),
              CustomTextField(
                focusNode: descriptionF,
                fillColor: AppColors.transparent,
                borderColor: AppColors.grayE0,
                controller: vm.businessDescriptionC,
                maxLines: 3,
                onChanged: (val) => vm.reBuildUI(),
              ),
              const YBox(20),
              Container(
                height: Sizer.height(49),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grayE0,
                  ),
                  borderRadius: BorderRadius.circular(Sizer.height(14)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(Sizer.radius(6)),
                      decoration: BoxDecoration(
                        color: AppColors.primaryOrange.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(Sizer.height(8)),
                      ),
                      child: Icon(
                        Iconsax.gallery_add,
                        color: AppColors.primaryOrange,
                        size: Sizer.height(14),
                      ),
                    ),
                    const XBox(10),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: 'Add Business Logo ',
                        style: AppTypography.text12.copyWith(
                          color: AppColors.text7D,
                        ),
                      ),
                      TextSpan(
                        text: '(Optional)',
                        style: AppTypography.text12.copyWith(
                          color: AppColors.primaryOrange,
                        ),
                      )
                    ]))
                  ],
                ),
              ),
              const YBox(30),
              CustomBtn.solid(
                online: vm.btnIsValid,
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Navigator.pushNamed(context, RoutePath.createPasswordScreen);
                },
                text: "Continue",
              ),
              const YBox(50),
            ],
          ),
        ),
      );
    });
  }
}
