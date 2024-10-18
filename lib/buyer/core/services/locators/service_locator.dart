import 'package:provider/single_child_widget.dart';
import 'package:soto_ecommerce/buyer/core/core.dart';

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BaseVM()),
];
