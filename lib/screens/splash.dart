import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/core/color.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../core/data.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Map<String, dynamic> pageData = {};
  loadData() async {
    AppData dataManager = AppData();
    final splashData = await dataManager.getSplashData();
    setState(() {
      pageData = splashData;
    });

    Future.delayed(Duration(milliseconds: pageData["delay"]), () {
      context.go("/loader");
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return pageData.isEmpty
        ? const SizedBox()
        : Scaffold(
            body: SafeArea(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: pageData["backgroundcolor"].isNotEmpty
                      ? HexColor(pageData["backgroundcolor"])
                      : null,
                ),
                child: Stack(
                  children: [
                    if (pageData["background"].isNotEmpty)
                      Image.network(
                        pageData["background"],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    if (pageData["logo"].isNotEmpty)
                      Center(
                        child: pageData["logo"].startsWith("https://")
                            ? Image.network(
                                pageData["logo"],
                                width: 100,
                              )
                            : Image.asset(
                                pageData["logo"],
                                width: 100,
                              ),
                      ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
