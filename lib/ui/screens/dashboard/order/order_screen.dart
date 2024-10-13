import 'package:soto_ecommerce/core/core.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: const Center(
          child: Text('Order Screen'),
        ),
      )),
    );
  }
}
