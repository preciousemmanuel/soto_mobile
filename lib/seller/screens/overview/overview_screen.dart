import 'package:soto_ecommerce/common/common.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Text('Overview'),
        ),
      ),
    );
  }
}
