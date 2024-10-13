import 'package:soto_ecommerce/core/core.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: const Center(
          child: Text('Cart Screen'),
        ),
      )),
    );
  }
}
