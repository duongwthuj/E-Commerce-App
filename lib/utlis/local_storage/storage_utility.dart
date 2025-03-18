import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal();

  // Lưu dữ liệu dưới dạng chuỗi
  Future<void> saveData(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  // Đọc dữ liệu
  Future<String?> readData(String key) async {
    return await _storage.read(key: key);
  }

  // Xóa một dữ liệu cụ thể
  Future<void> removeData(String key) async {
    await _storage.delete(key: key);
  }

  // Xóa toàn bộ dữ liệu
  Future<void> clearAllData() async {
    await _storage.deleteAll();
  }
}
