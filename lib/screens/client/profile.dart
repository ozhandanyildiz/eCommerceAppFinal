import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../widgets/bottomnavbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  MemoryImage? currentAvatar;

  installProfile() async {
    final Directory appCacheDir = await getTemporaryDirectory();
    File fileSave = File("${appCacheDir.path}/avatar.jpg");

    if (fileSave.existsSync()) {
      final imageBytes = await fileSave.readAsBytes();
      setState(() {
        currentAvatar = MemoryImage(imageBytes);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    installProfile();
  }

  ppUpdate() async {
    try {
      ImagePicker picker = ImagePicker();
      XFile? photoFile = await picker.pickImage(
          source: ImageSource.gallery, requestFullMetadata: false);
      if (photoFile == null) {
        return;
      }

      final fileBytes = await photoFile.readAsBytes();
      final fileFormat = photoFile.name.split(".").last.toLowerCase();

      img.Image? temp;
      switch (fileFormat) {
        case 'jpg':
        case 'jpeg':
          temp = img.decodeJpg(fileBytes);
          break;
        case 'png':
          temp = img.decodePng(fileBytes);
          break;
        case 'bmp':
          temp = img.decodeBmp(fileBytes);
          break;
        case 'tiff':
          temp = img.decodeTiff(fileBytes);
          break;
        case 'gif':
          temp = img.decodeGif(fileBytes);
          break;
        case 'ico':
          temp = img.decodeIco(fileBytes);
          break;
        default:
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text("File Type"),
              content: Text("File format not supported"),
            ),
          );
          return;
      }

      if (temp == null || temp.width < 480 || temp.height < 480) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("File Size"),
            content: Text("File size is too small (min 480px)"),
          ),
        );
        return;
      }

      img.Image thumbnail;
      if (temp.width >= temp.height) {
        thumbnail = img.copyResize(temp, height: 480);
      } else {
        thumbnail = img.copyResize(temp, width: 480);
      }

      final resizedFileData = img.encodeJpg(thumbnail, quality: 85);
      final Directory tempDir = await getTemporaryDirectory();

      File newFile = File("${tempDir.path}/avatar.jpg");
      await newFile.writeAsBytes(resizedFileData, flush: true);

      setState(() {
        currentAvatar = MemoryImage(resizedFileData);
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(height: 25),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: currentAvatar,
                        radius: 40,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: ppUpdate,
                          icon: Icon(Icons.camera_alt),
                          color: Color.fromARGB(255, 255, 115, 102),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Carla Willis",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(10),
                  Text(
                    "carlawillis@gmail.com",
                    style: TextStyle(
                      color: Color.fromRGBO(128, 128, 128, 1),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () => GoRouter.of(context).push("/login"),
                    child: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 115, 102),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'My Orders',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ">",
                              style: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Messages',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ">",
                              style: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Payment Methods',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              ">",
                              style: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                "/home",
                                (Route<dynamic> route) => false,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 8),
                                InkWell(
                                  onTap: () {
                                    GoRouter.of(context).push("/home");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(1.0),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "Settings",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            ">",
                            style: TextStyle(
                                color: Color.fromRGBO(128, 128, 128, 1)),
                          ),
                        ],
                      ),
                      Divider(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BNB(),
    );
  }
}
