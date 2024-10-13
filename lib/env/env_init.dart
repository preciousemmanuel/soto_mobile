// ignore_for_file: constant_identifier_names

import 'package:soto_ecommerce/core/core.dart';
import 'package:soto_ecommerce/env/env.dart';

class EnvMain {
  factory EnvMain() {
    return _singleton;
  }

  EnvMain._internal();

  static final EnvMain _singleton = EnvMain._internal();

  static const String DEV = 'dev';
  static const String STAGING = 'staging';
  static const String PROD = 'prod';

  late BaseEnv config;
  late String env;

  init(String environment) {
    config = _getConfig(environment);
    env = environment;
    printty("environment initialized....");
  }

  BaseEnv _getConfig(String environment) {
    switch (environment) {
      case EnvMain.PROD:
        return ProdEnv();
      case EnvMain.DEV:
        return DevEnv();
      case EnvMain.STAGING:
        return StagingEnv();
      default:
        return DevEnv();
    }
  }
}
