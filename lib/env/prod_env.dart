import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soto_ecommerce/env/env.dart';

class ProdEnv implements BaseEnv {
  @override
  String get baseUrl => dotenv.env['BASE_URL'] ?? "";
  @override
  bool get isProd => true;
}
