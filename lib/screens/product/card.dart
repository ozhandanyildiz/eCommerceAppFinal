import 'package:flutter/material.dart';
import 'package:flutter_advanced_dev/bloc/card/card_cubit.dart';
import 'package:flutter_advanced_dev/bloc/products/products_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/bottomnavbar.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
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
        title: const Text("My Cart"),
        centerTitle: true,
      ),
      body: BlocBuilder<CardCubit, CardState>(builder: (context, state) {
        return SizedBox.expand(
          child: ListView.builder(
            itemCount: state.sepet.length,
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
                                state.sepet[index]["photo"].toString()),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [],
                            ),
                            if (productsCubit
                                .isFavorites(state.sepet[index]["id"] as int))
                              IconButton(
                                onPressed: () {
                                  productsCubit.removeFromFavorites(
                                      state.sepet[index]["id"] as int);
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
                                  productsCubit
                                      .addToFavorites(state.sepet[index]);
                                },
                                icon: const Icon(
                                  Icons.favorite_border,
                                  size: 15,
                                ),
                              ),
                            IconButton(
                              onPressed: () {
                                cardCubit.sepettenCikar(
                                    id: state.sepet[index]["id"] as int);
                              },
                              icon: Row(
                                children: [
                                  const Icon(
                                    Icons.delete,
                                    size: 15,
                                    color: const Color.fromARGB(
                                      255,
                                      255,
                                      115,
                                      102,
                                    ),
                                  ),
                                ],
                              ),
                            )
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
                        state.sepet[index]["name"].toString(),
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
                      Text(state.sepet[index]["number"].toString() + "x"),
                      Text(
                        state.sepet[index]["productDescription"].toString(),
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
                              state.sepet[index]["price"].toString(),
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
                              onPressed: () {},
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
                                )), //
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
