import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class StorageService {
  final _box = GetStorage();

  Future<void> write({required String key, required value}) async {
    await _box.write(key, jsonEncode(value));
  }

  Map<String, dynamic> read({required String key}) {
    Map<String, dynamic> userMap = {};
    final String? data = _box.read(key);
    if (data != null) {
      userMap = jsonDecode(data) as Map<String, dynamic>;
    }
    return userMap;
  }

  Future<void> delete({required String key}) async {
    await _box.remove(key);
  }

  Future<void> clearAll() async {
    await _box.erase();
  }
}
