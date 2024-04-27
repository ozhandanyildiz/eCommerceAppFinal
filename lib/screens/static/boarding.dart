import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/core/storage.dart';
import 'package:go_router/go_router.dart';
import 'package:preload_page_view/preload_page_view.dart';

import '../../widgets/page/boarding_item.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({Key? key}) : super(key: key);

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final boardingData = [
    {
      "image": "assets/images/boarding1.png",
      "title": "Explore Products",
      "description":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sapien nisl, ultricies efficitur placerat vel, sollicitudin quis mi. Nulla cursus est nibh, sed interdum enim semper vel.",
    },
    {
      "image": "assets/images/boarding2.png",
      "title": "Easy Payment",
      "description":
          "Morbi quis ante libero. Fusce pharetra urna sed eros ultricies luctus. Fusce pharetra luctus condimentum. Nam arcu purus, auctor sit amet nunc in, condimentum scelerisque mi. Integer et nibh vitae ligula accumsan rutrum.",
    },
    {
      "image": "assets/images/boarding3.png",
      "title": "Fast Delivery",
      "description":
          "Mauris eu auctor dui, eget sagittis neque. Phasellus maximus faucibus neque, in tristique ipsum tempus a. Ut tellus justo, interdum nec posuere et, dapibus nec odio. Sed blandit turpis a dui fermentum, in pharetra mi rhoncus.",
    },
  ];
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PreloadPageView.builder(
          itemCount: boardingData.length,
          preloadPagesCount: boardingData.length,
          onPageChanged: (value) {
            setState(() {
              page = value;
            });
          },
          itemBuilder: (context, index) => BoardingItems(
              image: boardingData[index]["image"]!,
              title: boardingData[index]["title"]!,
              description: boardingData[index]["description"]!),
        ),
      ),
      bottomSheet: SizedBox(
          height: 70,
          child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: boardingData.length,
              itemBuilder: (context, index) => Icon(
                page == index ? Icons.remove : Icons.remove,
                color:
                    page == index ? Color.fromARGB(255, 255, 115, 102) : null,
              ),
            ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final storage = Storage();
                  await storage.firstLaunched();
                  GoRouter.of(context).replace("/login");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 115, 102),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fixedSize: Size(210, 38),
                ),
                child: Text(
                  page == 2 ? "Get started" : "Next",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
