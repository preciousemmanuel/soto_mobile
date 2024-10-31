import 'package:provider/single_child_widget.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/seller/vm/vm.dart';

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BaseVM()),
  ChangeNotifierProvider(create: (_) => LoginVM()),
  ChangeNotifierProvider(create: (_) => SignupVM()),
  ChangeNotifierProvider(create: (_) => PasswordVM()),
  ChangeNotifierProvider(create: (_) => AuthUserVM()),
  ChangeNotifierProvider(create: (_) => ProductVM()),

  // Seller
  ChangeNotifierProvider(create: (_) => CreateBusinessVM()),
];
