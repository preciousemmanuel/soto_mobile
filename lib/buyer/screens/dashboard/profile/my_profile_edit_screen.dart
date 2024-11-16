import 'package:soto_ecommerce/common/common.dart';

class MyProfileScreenEdit extends StatefulWidget {
  const MyProfileScreenEdit({super.key});

  @override
  State<MyProfileScreenEdit> createState() => _MyProfileScreenEditState();
}

class _MyProfileScreenEditState extends State<MyProfileScreenEdit> {
  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });

    super.initState();
  }

  void _init() {
    final vm = context.read<AuthUserVM>();
    firstNameC.text = vm.authUser?.firstName ?? '';
    lastNameC.text = vm.authUser?.lastName ?? '';
    phoneC.text = vm.authUser?.phoneNumber ?? '';
    emailC.text = vm.authUser?.email ?? '';

    setState(() {});
  }

  @override
  void dispose() {
    firstNameC.dispose();
    lastNameC.dispose();
    phoneC.dispose();
    emailC.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthUserVM>(
      builder: (context, ref, _) {
        return Scaffold(
          backgroundColor: AppColors.bgF5,
          appBar: const CustomHeader(
            title: 'My Profile',
            titleWeight: FontWeight.w500,
          ),
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const YBox(45),
                  ProfileAvatar(
                    width: 80,
                    height: 80,
                    initials: Text(
                      'PR',
                      style: AppTypography.text36.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const YBox(40),
                  CustomTextField(
                    fillColor: AppColors.transparent,
                    borderColor: AppColors.grayE0,
                    labelText: "First Name",
                    showLabelHeader: true,
                    hintText: 'Enter your first name',
                    controller: firstNameC,
                    onChanged: (val) => ref.reBuildUI(),
                  ),
                  const YBox(16),
                  CustomTextField(
                    fillColor: AppColors.transparent,
                    borderColor: AppColors.grayE0,
                    labelText: "Last Name",
                    showLabelHeader: true,
                    hintText: 'Enter your last name',
                    controller: lastNameC,
                    onChanged: (val) => ref.reBuildUI(),
                  ),
                  const YBox(16),
                  CustomTextField(
                    fillColor: AppColors.transparent,
                    borderColor: AppColors.grayE0,
                    labelText: "Email",
                    showLabelHeader: true,
                    hintText: 'Enter your email',
                    controller: emailC,
                    onChanged: (val) => ref.reBuildUI(),
                  ),
                  const YBox(16),
                  CustomTextField(
                    fillColor: AppColors.transparent,
                    borderColor: AppColors.grayE0,
                    labelText: "Phone Number",
                    showLabelHeader: true,
                    hintText: 'Enter your phone number',
                    controller: phoneC,
                    onChanged: (val) => ref.reBuildUI(),
                  ),
                  const YBox(16),
                  const Spacer(),
                  CustomBtn.solid(
                    online: activateBtn(),
                    borderRadius: BorderRadius.circular(40),
                    onTap: () {},
                    text: 'Save Changes',
                  ),
                  const YBox(40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bool activateBtn() {
    final vm = context.read<AuthUserVM>();
    return (vm.authUser?.firstName != firstNameC.text.trim() &&
            firstNameC.text.trim().isNotEmpty) ||
        (vm.authUser?.lastName != lastNameC.text.trim() &&
            lastNameC.text.trim().isNotEmpty) ||
        (vm.authUser?.email != emailC.text.trim() &&
            emailC.text.trim().isNotEmpty) ||
        (vm.authUser?.phoneNumber != phoneC.text.trim() &&
            phoneC.text.trim().isNotEmpty);
  }
}
