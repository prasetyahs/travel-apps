import 'package:travel/app/data/api_provider.dart';

class UserRepository {
  static Future<Map<String, dynamic>> editProfile(body) async {
    return await ApiProvider.put("api/users", body: body);
  }
}
