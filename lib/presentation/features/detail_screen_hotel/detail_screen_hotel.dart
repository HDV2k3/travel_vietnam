import 'package:chandoiqua/data/models/hotel.dart';
import 'package:chandoiqua/data/models/room_in_hotel.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/model/room_person_child.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/provider/days_provider.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/widget/room_person_conut_screen.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/widget/selected_date_time.dart';
import 'package:chandoiqua/presentation/features/payment_screen/payment_screen.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils.dart';
import '../../../data/providers/cart_provider.dart';
import '../../../utilities/widget/icon_button.dart';
import '../../common_widgets/base/base_screen.dart';
import '../sign_in/sign_in_screen.dart';
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
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: hotel.image != null && hotel.image!.isNotEmpty
                        ? Image.network(hotel.image![0]).image
                        : const AssetImage(
                            'assets/images/default_hotel.png'), // Provide a default image
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
                  ref
                      .watch(cartControllerProvider.notifier)
                      .addProductToCart(room!, context);
                  showSnackBar(context, "Added to Cart");
                },
                onSharePressed: () {
                  // Xử lý sự kiện khi nút share được nhấn
                },
              ),
            ),
            Positioned(
              top: 180,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 325,
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
                    Text(
                      ref.appLocalizations.tienIch,
                      style: const TextStyle(fontWeight: FontWeight.bold),
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
                        Row(
                          children: [
                            Text(ref.appLocalizations.nhanPhongVaTraPhong),
                            const SizedBox(
                              width: 55,
                            ),
                            Text(ref.appLocalizations.phongVaKhach),
                          ],
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SelectDateTimeHotel(),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                        Icons.door_front_door_rounded),
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 20, top: 470),
              child: getHotelDataWidget(context, hotel),
            ),
          ],
        ),
      ),
    );
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

  Widget getRoomDataWidget1(BuildContext context, String hotelId) {
    return Container(
      color: Colors.white,
      child: Consumer(
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
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
                                      child:
                                          Text(ref.appLocalizations.chiTiet)),
                                  // const SizedBox(
                                  //   height: 20,
                                  // ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.bedroom_parent_outlined,
                                        size: 20,
                                      ),
                                      Text(
                                          '${room.numberOfBeds!}${ref.appLocalizations.giuong}King')
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
                                        width: 10,
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
                                      Text(
                                          '${room.oldPrice! * numberOfDays}\$'),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          User? user =
                                              FirebaseAuth.instance.currentUser;
                                          if (user == null) {
                                            // Người dùng chưa đăng nhập, chuyển hướng đến màn hình đăng nhập
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const LogIn()),
                                            );
                                          } else {
                                            double totalPrice =
                                                room.oldPrice! * numberOfDays;
                                            // Tạo một đối tượng mới với giá trị mới cho trường oldPrice
                                            Room updatedRoom = room.copyWith(
                                                image: room.image,
                                                area: room.area,
                                                name: room.name,
                                                numberOfBeds: room.numberOfBeds,
                                                regulations: room.regulations,
                                                view: room.view,
                                                oldPrice: totalPrice);
                                            ref
                                                .watch(cartControllerProvider
                                                    .notifier)
                                                .addProductToCart(
                                                    updatedRoom, context);
                                            showSnackBar(
                                                context, "Added to Cart");

                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const PaymentVip()));
                                          }
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
                                        child: SizedBox(
                                          width: 60,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child:
                                                Text(ref.appLocalizations.dat),
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
                        const SizedBox(height: 10), // Thêm khoảng cách dọc
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

// Hàm cập nhật trường giá trị của tài liệu con trong tài liệu cha
  Future<void> updateChildDocumentValue(
      String parentCollection,
      String parentDocId,
      String childCollection,
      String childDocId,
      String field,
      dynamic value) async {
    try {
      // Lấy tham chiếu tới tài liệu cha
      DocumentReference parentRef = FirebaseFirestore.instance
          .collection(parentCollection)
          .doc(parentDocId);

      // Lấy tham chiếu tới tài liệu con trong tài liệu cha
      DocumentReference childRef =
          parentRef.collection(childCollection).doc(childDocId);

      // Cập nhật trường giá trị của tài liệu con
      await childRef.update({field: value});
      if (kDebugMode) {
        print('Cập nhật thành công');
      }
    } catch (e) {
      if (kDebugMode) {
        print('Lỗi khi cập nhật: $e');
      }
    }
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
