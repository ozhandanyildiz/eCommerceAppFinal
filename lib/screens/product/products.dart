import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/bloc/card/card_cubit.dart';
import 'package:flutter_advanced_dev/bloc/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/bottomnavbar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var products = [
    {
      "id": 1,
      "name": "SteelSeries Apex 7",
      "price": 6749.00,
      "productDescription": "Change the rules",
      "photo":
          "https://images-eu.ssl-images-amazon.com/images/I/61kdprH2xGL._AC_UL600_SR600,600_.jpg"
    },
    {
      "id": 2,
      "name": "Iphone 15",
      "price": 58499.00,
      "productDescription": "think differently",
      "photo":
          "https://m.media-amazon.com/images/I/71iCwW5Bd+L._AC_UF1000,1000_QL80_.jpg"
    },
    {
      "id": 3,
      "name": "Asus Rog Strix",
      "price": 49999.00,
      "productDescription": "Republic of Gamers",
      "photo":
          "https://m.media-amazon.com/images/I/51HLOu9IrIL._AC_UF1000,1000_QL80_.jpg"
    },
    {
      "id": 4,
      "name": "Playstation 5",
      "price": 24849.00,
      "productDescription": "It's time to play",
      "photo":
          "https://m.media-amazon.com/images/I/615iJqjOd3L._AC_UF894,1000_QL80_.jpg"
    },
    {
      "id": 5,
      "name": "Xbox Series X",
      "price": 25759.00,
      "productDescription": "Power Your Dreams",
      "photo": "https://m.media-amazon.com/images/I/515tLyCgdXL.jpg"
    },
  ];
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
        title: const Text("Products"),
      ),
      body:
          BlocBuilder<ProductsCubit, ProductsState>(builder: (context, state) {
        return SizedBox.expand(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                border: Border.all(),
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
                                products[index]["photo"].toString()),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Column(
                          children: [
                            if (productsCubit
                                .isFavorites(products[index]["id"] as int))
                              IconButton(
                                onPressed: () {
                                  productsCubit.removeFromFavorites(
                                      products[index]["id"] as int);
                                },
                                icon: const Icon(
                                  Icons.favorite,
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
                                  productsCubit.addToFavorites(products[index]);
                                },
                                icon: const Icon(
                                  Icons.favorite_border,
                                  size: 15,
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
                        products[index]["name"].toString(),
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
                        products[index]["productDescription"].toString(),
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
                              products[index]["price"].toString(),
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
                                    id: products[index]["id"] as int,
                                    photo: products[index]["photo"].toString(),
                                    ad: products[index]["name"].toString(),
                                    sayi: 1,
                                    fiyat: products[index]["price"] as double);
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
                                              Navigator.of(context).pop();
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
