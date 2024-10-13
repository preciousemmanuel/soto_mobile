import 'package:soto_ecommerce/core/core.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: const Center(
          child: Text('Favourite Screen'),
        ),
      )),
    );
  }
}
