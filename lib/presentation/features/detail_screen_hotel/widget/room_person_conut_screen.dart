import 'package:chandoiqua/presentation/common_widgets/base/base_screen.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/detail_state.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/detail_view_model.dart';
import 'package:chandoiqua/presentation/features/detail_screen_hotel/model/room_person_child.dart';
import 'package:flutter/material.dart';
import 'package:riverpod/src/common.dart';

import 'icon_and_text_back.dart';

class RoomAndPerson extends BaseScreen {
  const RoomAndPerson({super.key});

  @override
  BaseScreenState createState() => _RoomAndPersonState();
}

class _RoomAndPersonState extends BaseScreenState<RoomAndPerson,
    DetailHotelViewModel, DetailHotelState> {
  int countRoom = 1; // Biến count để theo dõi giá trị hiển thị
  int countPerson = 1; // Biến count để theo dõi giá trị hiển thị
  int countChild = 0; // Biến count để theo dõi giá trị hiển thị

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return null;
  }

  @override
  Widget buildBody(BuildContext context) {
    Color removeIconColorRoom =
        countRoom == 1 ? Colors.grey : Colors.red; // Màu của Icon "Remove"
    Color removeIconColorPerson =
        countRoom == 1 ? Colors.grey : Colors.red; // Màu của Icon "Remove"
    Color removeIconColorChild =
        countRoom == 1 ? Colors.grey : Colors.red; // Màu của Icon "Remove"
    return SafeArea(
      child: SizedBox(
        child: Stack(
          children: [
            Column(
              children: [
                Positioned(
                  top: 40,
                  child: IconTextBack(
                    onBackPressed: () {
                      final data = RoomPersonChildData(
                        countRoom: countRoom,
                        countPerson: countPerson,
                        countChild: countChild,
                      );
                      Navigator.pop(context, data); // Trả về đối tượng
                    },
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Phòng',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 180),
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: removeIconColorRoom,
                      ),
                      onPressed: () {
                        // Giảm giá trị count khi nhấn vào icon "Remove"
                        setState(() {
                          countRoom = countRoom > 1 ? countRoom - 1 : countRoom;
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    Text('$countRoom'), // Hiển thị giá trị count
                    const SizedBox(width: 5),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // Tăng giá trị count khi nhấn vào icon "Add"
                        setState(() {
                          if (countRoom < 10) {
                            // Kiểm tra nếu giá trị nhỏ hơn 30
                            countRoom++; // Tăng giá trị lên 1
                          }
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Người Lớn',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 137),
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: removeIconColorPerson,
                      ),
                      onPressed: () {
                        // Giảm giá trị count khi nhấn vào icon "Remove"
                        setState(() {
                          countPerson =
                              countPerson > 1 ? countPerson - 1 : countPerson;
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    Text('$countPerson'), // Hiển thị giá trị count
                    const SizedBox(width: 5),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // Tăng giá trị count khi nhấn vào icon "Add"
                        setState(() {
                          if (countPerson < 30) {
                            countPerson++;
                          }
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Trẻ em',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 175),
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: removeIconColorChild,
                      ),
                      onPressed: () {
                        // Giảm giá trị count khi nhấn vào icon "Remove"
                        setState(() {
                          countChild =
                              countChild > 1 ? countChild - 1 : countChild;
                        });
                      },
                    ),
                    const SizedBox(width: 5),
                    Text('$countChild'), // Hiển thị giá trị count
                    const SizedBox(width: 5),
                    IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      onPressed: () {
                        // Tăng giá trị count khi nhấn vào icon "Add"
                        setState(() {
                          if (countChild < 30) {
                            countChild++;
                          }
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        final data = RoomPersonChildData(
                          countRoom: countRoom,
                          countPerson: countPerson,
                          countChild: countChild,
                        );
                        Navigator.pop(context, data); // Trả về đối tượng
                      },
                      child: const SizedBox(
                        width: 100,
                        height: 20,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Hoàn Thành'),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement state
  AsyncValue<DetailHotelState> get state => throw UnimplementedError();

  @override
  // TODO: implement viewModel
  DetailHotelViewModel get viewModel => throw UnimplementedError();
}
