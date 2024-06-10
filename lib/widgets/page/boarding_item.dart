import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BoardingItems extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const BoardingItems({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(children: [
          Container(width: 500, height: 350, child: Image.asset(image)),
          Column(
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Gap(10),
              Text(
                description,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
