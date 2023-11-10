import 'package:shared_preferences/shared_preferences.dart';
import 'package:prova_flutter/models/data_model.dart';
import 'package:prova_flutter/stores/data_store.dart';

class AppDatabase {
  static Future<void> saveData(DataStore dataStore) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'dataList';
    final value = dataStore.dataList.map((data) => data.text).toList();
    prefs.setStringList(key, value);
  }

  static Future<void> loadData(DataStore dataStore) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'dataList';
    final List<String>? value = prefs.getStringList(key);

    if (value != null) {
      dataStore.dataList.clear();
      dataStore.dataList.addAll(value.map((text) => DataModel(text)));
    }
  }

  static Future<void> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'dataList';

    if (prefs.containsKey(key) && prefs.getStringList(key)!.isEmpty) {
      prefs.remove(key);
    }
  }
}
