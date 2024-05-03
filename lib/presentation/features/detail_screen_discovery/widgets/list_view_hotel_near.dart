import 'package:chandoiqua/presentation/controllers/hotel_controller.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/detail_screen_hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/hotel.dart';
import '../../../../data/providers/favorite_provider.dart';
import '../../discovery/widgets/error_text.dart';
import '../../discovery/widgets/favorite_icon.dart';
import '../../discovery/widgets/loader.dart';

class ListViewHotelNear extends ConsumerWidget {
  final String provinceName;
  const ListViewHotelNear(this.provinceName, {super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavorite = ref.watch(favoriteProvider);
    final AsyncValue<List<Hotel>> hotels =
        ref.watch(relatedHotelsProvider(provinceName));
    return Container(
      color: Colors.white, // Đặt màu nền cho ListView
      child: hotels.when(
          data: (data) {
            return Column(
              children: [
                Expanded(
                  child: SizedBox(
                    height: double.maxFinite,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        data[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const DetailScreenHotel(),
                                            settings: RouteSettings(
                                                arguments: data[index]),
                                          ),
                                        );
                                      },
                                      child: SizedBox(
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Image.network(
                                                  data[index].image![0],
                                                  fit: BoxFit.cover,
                                                  height: 200,
                                                  width: 340,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              left: 300,
                                              top: 10,
                                              child: FavoriteIcon(
                                                isFavorite: isFavorite,
                                                onPressed: () {},
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  data[index].name!,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${data[index].vote}/5',
                                                    ),
                                                    const Icon(
                                                      Icons.star,
                                                      color: Colors.yellow,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 150),
                                              child: Text(
                                                'Từ ${data[index].price!.toStringAsFixed(0)}\$',
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0,
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
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) => ErrorText(error: error.toString()),
          loading: () => const Loader()),
    );
  }
}
