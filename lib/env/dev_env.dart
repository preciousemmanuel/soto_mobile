import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:soto_ecommerce/env/env.dart';

class DevEnv implements BaseEnv {
  @override
  String get baseUrl => dotenv.env['DEV_URL'] ?? "";
  @override
  bool get isProd => false;
}
