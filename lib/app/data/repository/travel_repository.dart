import 'package:travel/app/data/api_provider.dart';

class TravelRepository {
  static Future<Map<String, dynamic>> getCategory() async {
    return await ApiProvider.get("api/category");
  }

  static Future<Map<String, dynamic>> getTravel(
      {lat, long, recommend = 0, isPopular = 0}) async {
    return await ApiProvider.get(
        "api/travel?my_lat=$lat&my_long=$long&recommend=$recommend&isPopular=$isPopular");
  }

  static Future<Map<String, dynamic>> getClustering(
      {lat, long, k, page = 1, limit = 10}) async {
    return await ApiProvider.get(
        "api/travel/cluster?my_lat=$lat&my_long=$long&k=5&page=$page");
  }
}
