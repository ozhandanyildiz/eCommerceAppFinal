import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<bool> firstLaunch() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    final runned = storage.getBool("runned");
    var counter = storage.getInt("launchCount");

    if (runned == null) {
      counter = 1;
      await storage.setInt("launchCount", 1);
      return true;
    } else {
      await storage.setInt("launchCount", counter! + 1);
      return false;
    }
  }

  firstLaunched() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.setBool("runned", true);
  }

  setConfig({required String? language, bool? darkmode}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    if (language != null) {
      await storage.setString("language", language);
    }
    if (darkmode != null) {
      await storage.setBool("darkmode", darkmode);
    }
  }

  getConfig() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return {
      "language": storage.getString("language"),
      "darkmode": storage.getBool("darkmode"),
    };
  }

  clearStorage() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }
}
