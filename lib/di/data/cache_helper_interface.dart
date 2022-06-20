abstract class CacheHelperInterface {
  Future<bool?>? saveData({
    required String key,
    required dynamic value,
  });

  Future<bool?>? getBool({required String key});
  Future<int?>? getInt({required String key});
  Future<double?>? getDouble({required String key});
  Future<String?>? getString({required String key});
}