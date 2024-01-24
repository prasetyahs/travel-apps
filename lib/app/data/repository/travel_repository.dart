import 'package:travel/app/data/api_provider.dart';

class TravelRepository {
  static Future<Map<String, dynamic>> getCategory() async {
    return await ApiProvider.get("api/category");
  }

  static Future<Map<String, dynamic>> getTravel(
      {lat, long, recommend = 0, isPopular = 0, categoryID}) async {
    print(
        "api/travel?my_lat=$lat&my_long=$long&recommend=$recommend&isPopular=$isPopular&category_id=$categoryID");
    return await ApiProvider.get(
        "api/travel?my_lat=$lat&my_long=$long&recommend=$recommend&isPopular=$isPopular&category_id=$categoryID");
  }

  static Future<Map<String, dynamic>> getClustering(
      {lat, long, k, page = 1, limit = 10}) async {
    return await ApiProvider.get(
        "api/travel/cluster?my_lat=$lat&my_long=$long&k=5&page=$page");
  }

  static Future<Map<String, dynamic>> getTravelSearch(
      {category, city, minPrice, maxPrice}) async {
    return await ApiProvider.get(
        "api/travel/search?category=$category&city=$city&min_price=$minPrice&max=$maxPrice");
  }

  static Future<Map<String, dynamic>> getMaxPrice() async {
    return await ApiProvider.get("api/travel/range-price");
  }

  static Future<Map<String, dynamic>> getLocation() async {
    return await ApiProvider.get("api/travel/get-location");
  }
}
