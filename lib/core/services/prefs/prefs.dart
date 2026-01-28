import 'package:hive_ce/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speak_live_go/core/services/prefs/pref_keys.dart';

class Prefs {

  /// Factory constructor for returning the singleton instance.
  factory Prefs() {
    return _instance;
  }

  Prefs._internal();
  /// Singleton instance of the class.
  static final Prefs _instance = Prefs._internal();

  /// Hive box instance for storage.
  late Box<String> _box;

  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    _box = await Hive.openBox<String>('pref_box_slg');
  }

  Future<void> write(PrefKeys key, String? value) async {
    if (value != null) {
      await _box.put(key.name, value);
    } else {
      await _box.delete(key.name);
    }
  }

  String? read(PrefKeys key) {
    return _box.get(key.name);
  }

  Future<void> delete(PrefKeys key) async {
    await _box.delete(key.name);
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
