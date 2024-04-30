import 'package:chandoiqua/data/models/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utilities/widget/icon_button.dart';
import '../../common_widgets/base/base_screen.dart';
import 'detail_state.dart';
import 'detail_view_model.dart';

class DetailPage extends BaseScreen {
  int numPeople;
  DetailPage({
    super.key,
    this.numPeople = 1,
  });
  @override
  BaseScreenState createState() => _DetailState();
}

class _DetailState extends BaseScreenState<DetailPage, DetailDiscoveryViewModel,
    DetailDiscoveryState> {
  int selectedIndex = -1;
  late bool isFavorite = false;
  Location? location;
  // final DiscoveryController discoveryController =
  //     Get.put(DiscoveryController());
  @override
  Widget buildBody(BuildContext context) {
    final location = ModalRoute.of(context)!.settings.arguments as Location;
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
                    image: Image.network(location.image ?? '').image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 40,
              child: IconButtonBar(
                onBackPressed: () {
                  Navigator.pop(context); // Quay lại trang trước đó
                },
                onFavoritePressed: () {
                  // Xử lý sự kiện khi nút favorite được nhấn
                },
                onSharePressed: () {
                  // Xử lý sự kiện khi nút share được nhấn
                },
              ),
            ),
            // info
            Positioned(
              top: 280,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: const BoxDecoration(
                  color: Colors.yellowAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          location.name ?? '',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.black54.withOpacity(0.8),
                          ),
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < location.vote!
                                      ? Colors.yellowAccent
                                      : Colors.blueGrey,
                                );
                              }),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              (location.vote ?? 0).toString(),
                              style: const TextStyle(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 5,
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
                          location.provinceName ?? '',
                          style: const TextStyle(
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Text(
                      'Mở Cửa Hàng Ngày',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(location.description ?? ''),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 470,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: Colors.grey,
                          child: SizedBox(
                            child: Text(
                              'Chi Tiết',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                                color: Colors.black54.withOpacity(0.8),
                              ),
                            ),
                          ),
                        )
                      ],
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
  AsyncValue<DetailDiscoveryState> get state =>
      ref.watch(detailDiscoveryViewModelProvider);

  @override
  // TODO: implement viewModel
  DetailDiscoveryViewModel get viewModel =>
      ref.read(detailDiscoveryViewModelProvider.notifier);
}
// Positioned(
// bottom: 20,
// left: 20,
// right: 20,
// child: Row(
// children: [
// // add favorite
// ButtonAddToFavorite(
// size: 60,
// color: isFavorite ? Colors.red : Colors.black,
// backgroundColor: Colors.white,
// borderColor: Colors.deepPurple,
// isIcon: true,
// icon: isFavorite ? Icons.favorite : Icons.favorite_border,
// onPressed: () {
// discoveryController.addToFavorite(
// title: location.name ?? '',
// image: location.image ?? '',
// price: location.price!.toString(),
// location: location.provinceName ?? '',
// );
// setState(() {
// isFavorite = true;
// });
// },
// ),
// const SizedBox(
// width: 20,
// ),
// // book tour
// GestureDetector(
// onTap: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => CartScreen(
// image: location.image ?? "",
// title: location.name ?? "",
// price: (((widget.numPeople - 1) * 300) +
// (location.price ?? 0))
//     .toStringAsFixed(0),
// location: location.provinceName ?? "",
// numPeople: widget.numPeople,
// ),
// ),
// );
// },
// child: const ResponsiveButton(
// isResponsive: true,
// ),
// ),
// ],
// ),
// ),
