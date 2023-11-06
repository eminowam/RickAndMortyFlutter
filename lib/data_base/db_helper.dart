import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  static const String _kPrefsKey = 'saved_items';

  static Future<List<int>> getSavedCharacters() async {
    final prefs = await SharedPreferences.getInstance();
    final savedIds = prefs.getStringList(_kPrefsKey) ?? [];

    return savedIds.map(int.parse).toList();
  }

  static Future<void> saveCharacter(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final savedIds = prefs.getStringList(_kPrefsKey) ?? [];

    savedIds.add(id.toString());

    await prefs.setStringList(_kPrefsKey, savedIds);
  }

  static Future<void> deleteItem(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final deleteIds = prefs.getStringList(_kPrefsKey) ?? [];

    deleteIds.remove(id.toString());

    await prefs.setStringList(_kPrefsKey, deleteIds);
  }
}
