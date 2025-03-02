import 'package:cloud_radar/data/database_config.dart';
import 'package:http/http.dart' as http;

class WeatherProvider {
  Future<http.Response> getPredictions(String city) async {
    final predictions = await http.get(
      Uri.parse("${DatabaseConfig.baseUrl}&city_name=$city"),
    );

    return predictions;
  }
}
