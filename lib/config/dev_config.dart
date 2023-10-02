import 'package:flutter_template/config/base_config.dart';
import 'package:logger/logger.dart';

class DevConfig implements BaseConfig {
  @override
  String get baseUrl => 'https://dummyjson.com/';

  @override
  Level get logLevel => Level.trace;

  @override
  bool get useNetwork => false;
}
