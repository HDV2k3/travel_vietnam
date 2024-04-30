import 'package:chandoiqua/data/models/hotel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utilities/widget/icon_button.dart';
import '../../common_widgets/base/base_screen.dart';
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
                  // Quay lại trang trước đó
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
                height: 500,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
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
