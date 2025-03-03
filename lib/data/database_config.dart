import 'package:cloud_radar/env/env.dart';

class DatabaseConfig {
  DatabaseConfig._();
  static String baseUrl = "https://api.hgbrasil.com/weather?array_limit=5&fields=only_results&key=${Env.apiKey}";
}