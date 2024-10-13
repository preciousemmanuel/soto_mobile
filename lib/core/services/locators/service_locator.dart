import 'package:provider/single_child_widget.dart';
import 'package:soto_ecommerce/core/core.dart';

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => BaseVM()),
];
