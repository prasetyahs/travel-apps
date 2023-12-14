import 'dart:convert';
import '../../utilities/env.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static const _baseUrl = Env.API_URL;
  static const Map<String, String> headers = {
    "Content-Type": "application/json"
  };
  static Future<Map<String, dynamic>> post(url, body) {
    return http
        .post(Uri.parse("$_baseUrl$url"),
            body: jsonEncode(body), headers: headers)
        .then((value) => jsonDecode(value.body));
  }

  static Future<Map<String, dynamic>> get(url) {
    return http
        .get(Uri.parse("$_baseUrl$url"), headers: headers)
        .then((value) => jsonDecode(value.body));
  }

  static Future<Map<String, dynamic>> put(url, {headers, body}) {
    return http
        .put(Uri.parse("$_baseUrl$url"),
            headers: headers, body: jsonEncode(body))
        .then((value) => jsonDecode(value.body));
  }

  static Future<Map<String, dynamic>> delete(url) {
    return http
        .delete(Uri.parse("$_baseUrl$url"), headers: headers)
        .then((value) => jsonDecode(value.body));
  }
}
