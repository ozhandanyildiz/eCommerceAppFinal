import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  loadApp() async {
    final storage = Storage();
    //storage.clearStorage();
    final firstLaunched = await storage.firstLaunch();

    if (firstLaunched) {
      const darkmode = ThemeMode.system == ThemeMode.dark;

      await storage.setConfig(
          language: getDeviceLanguage(), darkmode: darkmode);

      GoRouter.of(context).replace("/boarding");
    } else {
      final config = await storage.getConfig();
      if (config["language"] == null) {
        storage.setConfig(language: getDeviceLanguage());
      }
      if (config["darkmode"] == null) {
        const darkmode = ThemeMode.system == ThemeMode.dark;
        await storage.setConfig(darkmode: darkmode, language: 'en' 'tr');
      }

      GoRouter.of(context).replace("/login");
    }
  }

  getDeviceLanguage() {
    final String defaultLocale;
    if (!kIsWeb) {
      defaultLocale = Platform.localeName;
    } else {
      defaultLocale = "en";
    }

    final langParts = defaultLocale.split("_");

    final supportedLanguages = ["en", "tr"];
    final String finalLang;
    if (supportedLanguages.contains(langParts[0])) {
      finalLang = langParts[0];
    } else {
      finalLang = "en";
    }
    return finalLang;
  }

  @override
  void initState() {
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: CircularProgressIndicator(),
    ));
  }
}
