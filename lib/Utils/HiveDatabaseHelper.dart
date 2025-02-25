import 'package:hive/hive.dart';

class HiveDatabaseHelper {
  static final HiveDatabaseHelper _instance = HiveDatabaseHelper._internal();

  factory HiveDatabaseHelper() => _instance;

  HiveDatabaseHelper._internal();

  /// Open a Hive box if not already open
  Future<Box<T>> _openBox<T>(String boxName) async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<T>(boxName);
    }
    return Hive.box<T>(boxName);
  }

  /// Save a value in Hive
  Future<void> save<T>(String boxName, String key, T value) async {
    final box = await _openBox<T>(boxName);
    await box.put(key, value);
  }

  /// Get a value from Hive
  Future<T?> get<T>(String boxName, String key) async {
    final box = await _openBox<T>(boxName);
    return box.get(key);
  }

  /// Get all values from Hive
  Future<List<T>> getAll<T>(String boxName) async {
    final box = await _openBox<T>(boxName);
    return box.values.toList();
  }

  /// Delete a value from Hive
  Future<void> delete<T>(String boxName, String key) async {
    final box = await _openBox<T>(boxName);
    await box.delete(key);
  }

  /// Clear all data from a box
  Future<void> clearBox<T>(String boxName) async {
    final box = await _openBox<T>(boxName);
    await box.clear();
  }
}
