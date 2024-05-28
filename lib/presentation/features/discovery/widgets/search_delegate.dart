import 'package:chandoiqua/presentation/features/detail_screen_hotel/detail_screen_hotel.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
              ? ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
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
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 1,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      scale: 8,
                                      data[index].image![0],
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              data[index].name!,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            const Icon(
                                              Icons.location_on,
                                              size: 18,
                                              color: Colors.deepPurple,
                                            ),
                                            Text(
                                              data[index].provinceName!,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                ref.appLocalizations.giaMoi,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                width: 60,
                                              ),
                                              Text(
                                                ref.appLocalizations.giaCu,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                data[index].price.toString(),
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                width: 60,
                                              ),
                                              Text(
                                                data[index].oldPrice.toString(),
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.blue,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
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
          return ListView.builder(
              itemCount: data.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
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
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 1,
                      child: Stack(
                        children: [
                          Positioned(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  data[index].image![0],
                                  fit: BoxFit.cover,
                                  height: 130,
                                  width: 150,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          data[index].name!,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        const Icon(
                                          Icons.location_on,
                                          size: 18,
                                          color: Colors.deepPurple,
                                        ),
                                        Text(
                                          data[index].provinceName!,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 50,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            ref.appLocalizations.giaMoi,
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            width: 60,
                                          ),
                                          Text(
                                            ref.appLocalizations.giaCu,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${data[index].price}\$',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            width: 60,
                                          ),
                                          Text(
                                            '${data[index].oldPrice}\$',
                                            style: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
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
