import 'package:chandoiqua/data/models/room_in_hotel.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/detail_screen_hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils.dart';
import '../../../../data/providers/cart_provider.dart';
import '../../../../data/providers/hotel_provider.dart';
import 'error_text.dart';
import 'loader.dart';

class SearchProducts extends SearchDelegate {
  final WidgetRef ref;
  SearchProducts(this.ref);
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    final products = ref.watch(searchHotels(query));
    return products.when(
        data: (data) {
          return data.isNotEmpty
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 3),
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final product = data[index];
                    return Padding(
                      padding: const EdgeInsets.all(2),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DetailScreenHotel(),
                                  settings:
                                      RouteSettings(arguments: data[index])));
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 1,
                          child: Stack(
                            children: [
                              Container(
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 32,
                                    ),
                                    Flexible(
                                      child: Image.network(
                                        data[index].image![0],
                                        fit: BoxFit.fitHeight,
                                        height: 150,
                                        width: double.infinity,
                                      ),
                                    ),
                                    Center(
                                        child: Text(
                                      data[index].name!,
                                      style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    )),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "\$${data[index].price}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            "\$${data[index].oldPrice}",
                                            style: const TextStyle(
                                                fontSize: 18,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  top: 10,
                                  right: 20,
                                  child: Stack(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            ref
                                                .watch(cartControllerProvider
                                                    .notifier)
                                                .addProductToCart(
                                                    product as Room, context);
                                            showSnackBar(
                                                context, "Added to Cart");
                                          },
                                          child: const Icon(
                                            Icons.shopping_cart,
                                            color: Colors.blue,
                                            size: 30,
                                          )),
                                    ],
                                  )),
                              Positioned(
                                  top: 5,
                                  left: 0,
                                  child: data[index].isAvailable != false
                                      ? const Text("")
                                      : Container(
                                          decoration: BoxDecoration(
                                              color: Colors.blueAccent,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: const Text(
                                            "Out Of Stock",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ))
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : const Center(
                  child: Text(
                    "We don't have such a product",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                );
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final products = ref.watch(searchHotels(query));
    return products.when(
        data: (data) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 2 / 3),
              itemCount: data.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final product = data[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DetailScreenHotel(),
                              settings: RouteSettings(arguments: data[index])));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 1,
                      child: Stack(
                        children: [
                          Container(
                            height: 180,
                            width: 180,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 32,
                                ),
                                Flexible(
                                  child: Image.network(
                                    data[index].image![0],
                                    fit: BoxFit.fitHeight,
                                    height: 150,
                                    width: double.infinity,
                                  ),
                                ),
                                Center(
                                    child: Text(
                                  data[index].name!,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )),
                                const SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${data[index].price}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        "\$${data[index].oldPrice}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w600,
                                            decoration:
                                                TextDecoration.lineThrough),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                              top: 10,
                              right: 20,
                              child: Stack(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        ref
                                            .watch(
                                                cartControllerProvider.notifier)
                                            .addProductToCart(
                                                product as Room, context);
                                        showSnackBar(context, "Added to Cart");
                                      },
                                      child: const Icon(
                                        Icons.shopping_cart,
                                        color: Colors.blue,
                                        size: 30,
                                      )),
                                ],
                              )),
                          Positioned(
                              top: 5,
                              left: 0,
                              child: data[index].isAvailable != false
                                  ? const Text("")
                                  : Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const Text(
                                        "Out Of Stock",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ))
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        error: (error, stackTrace) => ErrorText(error: error.toString()),
        loading: () => const Loader());
  }
}
