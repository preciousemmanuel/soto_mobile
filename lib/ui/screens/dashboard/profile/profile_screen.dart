import 'package:soto_ecommerce/core/core.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: const Center(
          child: Text('Profile Screen'),
        ),
      )),
    );
  }
}
