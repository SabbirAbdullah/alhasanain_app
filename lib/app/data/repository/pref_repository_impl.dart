import 'package:alhasanain_app/app/data/repository/pref_repository.dart';
import 'package:get/get.dart';
import '../local/preference/preference_manager.dart';

class PrefRepositoryImpl implements PrefRepository{
  final PreferenceManager _prefSource =
  Get.find(tag: (PreferenceManager).toString());
  @override
  Future<bool> clear() {
   return _prefSource.clear();
    throw UnimplementedError();
  }

  @override
  Future<bool> getBool(String key, {bool defaultValue = false}) {
   return _prefSource.getBool(key,defaultValue: false);
    throw UnimplementedError();
  }

  @override
  Future<double> getDouble(String key, {double defaultValue = 0.0}) {
    // TODO: implement getDouble
    throw UnimplementedError();
  }

  @override
  Future<int> getInt(String key, {int defaultValue = 0}) {
    // TODO: implement getInt
    throw UnimplementedError();
  }

  @override
  Future<String> getString(String key, {String defaultValue = ""}) {
    return _prefSource.getString(key,defaultValue:"");
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getStringList(String key, {List<String> defaultValue = const []}) {
    // TODO: implement getStringList
    throw UnimplementedError();
  }

  @override
  Future<bool> remove(String key) {
   return _prefSource.remove(key);
    throw UnimplementedError();
  }

  @override
  Future<bool> setBool(String key, bool value) {
    // TODO: implement setBool
    throw UnimplementedError();
  }

  @override
  Future<bool> setDouble(String key, double value) {
    // TODO: implement setDouble
    throw UnimplementedError();
  }

  @override
  Future<bool> setInt(String key, int value) {
    // TODO: implement setInt
    throw UnimplementedError();
  }

  @override
  Future<bool> setString(String key, String value) {
return _prefSource.setString(key,value);
    throw UnimplementedError();
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    // TODO: implement setStringList
    throw UnimplementedError();
  }

}