import 'dart:convert';

import 'package:flutter/services.dart';

class AppData {
  Future<Map<String, dynamic>> getSplashData() async {
    final data = await loadJsonFromAssets("assets/static/splash.json");
    return data;
  }

  Future<Map<String, dynamic>> loadJsonFromAssets(String filePath) async {
    String jsonString = await rootBundle.loadString(filePath);
    return jsonDecode(jsonString);
  }
}
