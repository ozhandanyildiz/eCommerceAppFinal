import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/bloc/card/card_cubit.dart';
import 'package:flutter_advanced_dev/bloc/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/bottomnavbar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  late ProductsCubit productsCubit;
  late CardCubit cardCubit;
  @override
  void initState() {
    productsCubit = context.read<ProductsCubit>();
    cardCubit = context.read<CardCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        centerTitle: true,
      ),
      body:
          BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
        return SizedBox.expand(
          child: ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary.withAlpha(50),
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.all(14.0),
              padding: const EdgeInsets.all(14.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 110,
                        height: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                state.favorites[index]["photo"].toString()),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Column(
                          children: [
                            if (productsCubit.isFavorites(
                                state.favorites[index]["id"] as int))
                              IconButton(
                                onPressed: () {
                                  productsCubit.removeFromFavorites(
                                      state.favorites[index]["id"] as int);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 15,
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    115,
                                    102,
                                  ),
                                ),
                              )
                            else
                              IconButton(
                                onPressed: () {
                                  productsCubit
                                      .addToFavorites(state.favorites[index]);
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  size: 15,
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    115,
                                    102,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.favorites[index]["name"].toString(),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(
                              255,
                              255,
                              115,
                              102,
                            )),
                      ),
                      Text(
                        state.favorites[index]["productDescription"].toString(),
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: Text(
                              state.favorites[index]["price"].toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    115,
                                    102,
                                  )),
                            ),
                          ),
                          SizedBox(width: 40),
                          Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: ElevatedButton(
                              onPressed: () {
                                cardCubit.sepeteekle(
                                    id: state.favorites[index]["id"] as int,
                                    photo: state.favorites[index]["photo"],
                                    ad: state.favorites[index]["name"]
                                        .toString(),
                                    sayi: 1,
                                    fiyat: state.favorites[index]["price"]
                                        as double);
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text("Shop"),
                                    content: Text(
                                      "product added to cart",
                                    ),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              GoRouter.of(context)
                                                  .push("/card");
                                              Navigator.of(context)
                                                  .pop(); // Diyalog kapatılıyor
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 255, 115, 102),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: Text(
                                              "Go to cart",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 255, 115, 102),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: Text(
                                              "Continue",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                'Buy',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(
                                  255,
                                  255,
                                  115,
                                  102,
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
      bottomNavigationBar: const BNB(),
    );
  }
}
