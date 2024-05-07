import 'package:chandoiqua/data/models/hotel.dart';
import 'package:chandoiqua/data/models/room_in_hotel.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/model/room_person_child.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/provider/days_provider.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/widget/room_person_conut_screen.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/widget/selected_date_time.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utilities/widget/icon_button.dart';
import '../../common_widgets/base/base_screen.dart';
import '../cart_screen/cart_screen.dart';
import 'detail_state.dart';
import 'detail_view_model.dart';

class DetailScreenHotel extends BaseScreen {
  const DetailScreenHotel({
    super.key,
  });
  @override
  BaseScreenState createState() => _DetailHotelState();
}

class _DetailHotelState extends BaseScreenState<DetailScreenHotel,
    DetailHotelViewModel, DetailHotelState> {
  int selectedIndex = -1;
  late bool isFavorite = false;
  Hotel? hotel;
  // final DiscoveryController discoveryController =
  //     Get.put(DiscoveryController());
  int countRoom = 1;
  int countPerson = 2;
  int countChild = 0;

  Room? room;

  @override
  Widget buildBody(BuildContext context) {
    final hotel = ModalRoute.of(context)!.settings.arguments as Hotel;
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            // ảnh
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(hotel.image![0]).image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              child: IconButtonBar(
                onBackPressed: () {
                  Navigator.pop(context);
                },
                onFavoritePressed: () {
                  // Xử lý sự kiện khi nút favorite được nhấn
                },
                onSharePressed: () {
                  // Xử lý sự kiện khi nút share được nhấn
                },
              ),
            ),
            Positioned(
              top: 280,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 305,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          hotel.name!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black54.withOpacity(0.8),
                          ),
                        ),
                        Wrap(
                          children: List.generate(5, (index) {
                            return Icon(
                              Icons.star,
                              color: index < hotel.vote!
                                  ? Colors.yellowAccent
                                  : Colors.blueGrey,
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.deepPurple,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          hotel.provinceName!,
                          style: const TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      hotel.description!,
                      style: const TextStyle(color: Colors.lightBlue),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    const Text(
                      'Tiện Ích',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Wrap(
                      children: hotel.utilities!.map((utility) {
                        return Container(
                          margin: const EdgeInsets.only(right: 40),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            utility,
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Column(
                      children: [
                        const Row(
                          children: [
                            Text('Nhận phòng và trả phòng'),
                            SizedBox(
                              width: 55,
                            ),
                            Text('Phòng và khách'),
                          ],
                        ),
                        Row(
                          children: [
                            const SelectDateTimeHotel(),
                            Row(
                              children: [
                                IconButton(
                                  icon:
                                      const Icon(Icons.door_front_door_rounded),
                                  // Trong hàm onPressed của IconButton
                                  onPressed: () async {
                                    final data = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RoomAndPerson(),
                                      ),
                                    );

                                    // Sau khi nhận dữ liệu trả về, bạn có thể thực hiện xử lý tại đây
                                    if (data != null &&
                                        data is RoomPersonChildData) {
                                      updateCountRoom(data);
                                    }
                                  },
                                ),
                                Text(countRoom.toString()),
                                IconButton(
                                  icon: const Icon(Icons.person),
                                  onPressed: () async {
                                    final data = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RoomAndPerson(),
                                      ),
                                    );

                                    // Sau khi nhận dữ liệu trả về, bạn có thể thực hiện xử lý tại đây
                                    if (data != null &&
                                        data is RoomPersonChildData) {
                                      updateCountRoom(data);
                                    }
                                  },
                                ),
                                Text(countPerson.toString()),
                                IconButton(
                                  icon: const Icon(Icons.child_care),
                                  onPressed: () async {
                                    final data = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RoomAndPerson(),
                                      ),
                                    );

                                    // Sau khi nhận dữ liệu trả về, bạn có thể thực hiện xử lý tại đây
                                    if (data != null &&
                                        data is RoomPersonChildData) {
                                      updateCountRoom(data);
                                    }
                                  },
                                ),
                                Text(countChild.toString()),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 580,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
                width: MediaQuery.of(context).size.width,
                height: 1000,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      // topLeft: Radius.circular(30),
                      // topRight: Radius.circular(30),
                      ),
                ),
                child: getHotelDataWidget(context, hotel),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateCountRoom(RoomPersonChildData data) {
    setState(() {
      countRoom = data.countRoom;
      countPerson = data.countPerson;
      countChild = data.countChild;
    });
  }

  Widget getHotelDataWidget(BuildContext context, Hotel hotel) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('hotels')
          .where('name', isEqualTo: hotel.name!)
          .limit(1)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final QuerySnapshot<Map<String, dynamic>> querySnapshot =
              snapshot.data!;
          if (querySnapshot.docs.isNotEmpty) {
            final DocumentSnapshot<Map<String, dynamic>> document =
                querySnapshot.docs.first;
            final String hotelId = document.id;
            return getRoomDataWidget1(context, hotelId);
          } else {
            return const Text('No hotel found with the given name.');
          }
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }

  // Widget getRoomDataWidget(BuildContext context, String hotelId) {
  //   final numberOfDays = DataCountDay.numberOfDays;
  //   return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
  //     stream: FirebaseFirestore.instance
  //         .collection('hotels')
  //         .doc(hotelId)
  //         .collection('room')
  //         .snapshots(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
  //             snapshot.data!.docs;
  //         return ListView.builder(
  //           itemCount: documents.length,
  //           itemBuilder: (context, index) {
  //             final QueryDocumentSnapshot<Map<String, dynamic>> document =
  //                 documents[index];
  //             final Room room = Room.fromJson(document.data());
  //             return Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Row(
  //                   children: [
  //                     ClipRRect(
  //                       borderRadius: BorderRadius.circular(10),
  //                       child: Image.network(
  //                         room.image![0],
  //                         fit: BoxFit.cover,
  //                         height: 180,
  //                         width: 150,
  //                       ),
  //                     ),
  //                     Padding(
  //                       padding:
  //                           const EdgeInsets.only(top: 0, bottom: 0, left: 20),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Text(
  //                             room.name!,
  //                             style:
  //                                 const TextStyle(fontWeight: FontWeight.bold),
  //                           ),
  //                           TextButton(
  //                               onPressed: () {},
  //                               child: const Text('Chi tiết')),
  //                           // const SizedBox(
  //                           //   height: 20,
  //                           // ),
  //                           Row(
  //                             children: [
  //                               const Icon(
  //                                 Icons.bedroom_parent_outlined,
  //                                 size: 20,
  //                               ),
  //                               Text('${room.numberOfBeds!} giường king')
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               const Icon(
  //                                 Icons.area_chart_outlined,
  //                                 size: 20,
  //                               ),
  //                               Text('${room.area!}m²'),
  //                               const SizedBox(
  //                                 width: 20,
  //                               ),
  //                               const Icon(
  //                                 Icons.living_outlined,
  //                                 size: 20,
  //                               ),
  //                               const SizedBox(
  //                                 width: 5,
  //                               ),
  //                               Text(room.view!),
  //                             ],
  //                           ),
  //                           Row(
  //                             children: [
  //                               const Icon(Icons.smoke_free_outlined),
  //                               const SizedBox(
  //                                 width: 10,
  //                               ),
  //                               Text(room.regulations!),
  //                             ],
  //                           ),
  //
  //                           Row(
  //                             children: [
  //                               Text('${room.oldPrice! * numberOfDays}\$'),
  //                               const SizedBox(
  //                                 width: 20,
  //                               ),
  //                               ElevatedButton(
  //                                 onPressed: () {},
  //                                 style: ElevatedButton.styleFrom(
  //                                   foregroundColor: Colors.white,
  //                                   backgroundColor:
  //                                       Colors.blue, // Màu nền của nút
  //                                   shape: RoundedRectangleBorder(
  //                                     borderRadius: BorderRadius.circular(
  //                                         0), // Bo góc, bạn có thể đặt giá trị bất kỳ, 0 để không bo góc
  //                                   ),
  //                                 ),
  //                                 child: const SizedBox(
  //                                   width: 80,
  //                                   child: Align(
  //                                     alignment: Alignment.center,
  //                                     child: Text('Đặt'),
  //                                   ),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             );
  //           },
  //         );
  //       } else if (snapshot.hasError) {
  //         return Text('Error: ${snapshot.error}');
  //       } else {
  //         return const CircularProgressIndicator();
  //       }
  //     },
  //   );
  // }

  Widget getRoomDataWidget1(BuildContext context, String hotelId) {
    return Consumer(
      builder: (context, ref, child) {
        final numberOfDays = ref.watch(daysProvider);
        return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('hotels')
              .doc(hotelId)
              .collection('room')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<QueryDocumentSnapshot<Map<String, dynamic>>>
                  documents = snapshot.data!.docs;
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final QueryDocumentSnapshot<Map<String, dynamic>> document =
                      documents[index];
                  final Room room = Room.fromJson(document.data());
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              room.image![0],
                              fit: BoxFit.cover,
                              height: 180,
                              width: 150,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, bottom: 0, left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  room.name!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text('Chi tiết')),
                                // const SizedBox(
                                //   height: 20,
                                // ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.bedroom_parent_outlined,
                                      size: 20,
                                    ),
                                    Text('${room.numberOfBeds!} giường king')
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.area_chart_outlined,
                                      size: 20,
                                    ),
                                    Text('${room.area!}m²'),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    const Icon(
                                      Icons.living_outlined,
                                      size: 20,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(room.view!),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.smoke_free_outlined),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(room.regulations!),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Text('${room.oldPrice! * numberOfDays}\$'),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const CartScreen()));
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor:
                                            Colors.blue, // Màu nền của nút
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              0), // Bo góc, bạn có thể đặt giá trị bất kỳ, 0 để không bo góc
                                        ),
                                      ),
                                      child: const SizedBox(
                                        width: 80,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text('Đặt'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        );
      },
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  @override
  // TODO: implement state
  AsyncValue<DetailHotelState> get state =>
      ref.watch(detailHotelViewModelProvider);

  @override
  // TODO: implement viewModel
  DetailHotelViewModel get viewModel =>
      ref.read(detailHotelViewModelProvider.notifier);
}
