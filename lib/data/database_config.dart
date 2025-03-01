import 'package:cloud_radar/env/env.dart';

class DatabaseConfig {
  DatabaseConfig._();
  static String baseUrl = "https://api.hgbrasil.com/weather?key=${Env.apiKey}";
}