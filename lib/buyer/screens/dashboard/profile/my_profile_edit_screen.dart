import 'package:soto_ecommerce/common/common.dart';

class MyProfileScreenEdit extends StatefulWidget {
  const MyProfileScreenEdit({super.key});

  @override
  State<MyProfileScreenEdit> createState() => _MyProfileScreenEditState();
}

class _MyProfileScreenEditState extends State<MyProfileScreenEdit> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgF5,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const YBox(10),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: const CustomHeader(
                title: 'My Profile',
                titleWeight: FontWeight.w500,
              ),
            ),
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
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Sizer.width(20),
              ),
              child: CustomBtn.solid(
                borderRadius: BorderRadius.circular(40),
                onTap: () {},
                text: 'Save Changes',
              ),
            ),
            const YBox(40),
          ],
        ),
      ),
    );
  }
}
