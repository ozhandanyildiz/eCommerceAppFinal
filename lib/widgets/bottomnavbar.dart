import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BNB extends StatelessWidget {
  const BNB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: IconButton(
                  onPressed: () => GoRouter.of(context).push("/products"),
                  icon: const Icon(Icons.home_outlined,
                      color: const Color.fromRGBO(174, 174, 178, 1)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: IconButton(
                  onPressed: () => GoRouter.of(context).push(("/favorites")),
                  icon: const Icon(Icons.favorite_outlined,
                      color: const Color.fromRGBO(174, 174, 178, 1)),
                ),
              ),
              IconButton(
                onPressed: () => GoRouter.of(context).push("/card"),
                icon: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 255, 115, 102),
                  child: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: IconButton(
                  onPressed: () => GoRouter.of(context).push("/notifications"),
                  icon: const Icon(Icons.notifications_outlined,
                      color: const Color.fromRGBO(174, 174, 178, 2)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: IconButton(
                  onPressed: () => GoRouter.of(context).push("/profile"),
                  icon: const Icon(Icons.person_outlined,
                      color: const Color.fromRGBO(174, 174, 178, 1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
