

import 'package:base_flutter/general/utilities/dio_helper/cahce_lib/core/obj.dart';

abstract class ICacheStore {
  ICacheStore();

  Future<CacheObj?> getCacheObj(String key, {String subKey});

  Future<bool> setCacheObj(CacheObj obj);

  Future<bool> delete(String key, {String subKey});

  Future<bool> clearExpired();

  Future<bool> clearAll();
}