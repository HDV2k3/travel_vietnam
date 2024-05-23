import 'package:chandoiqua/data/models/location.dart';
import 'package:chandoiqua/presentation/features/detail_screen_discovery/widgets/list_view_hotel_near.dart';
import 'package:chandoiqua/presentation/features/detail_screen_discovery/widgets/slider_activi.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utilities/widget/icon_button.dart';
import '../../common_widgets/base/base_screen.dart';
import 'detail_state.dart';
import 'detail_view_model.dart';

class DetailPage extends BaseScreen {
  const DetailPage({
    super.key,
  });
  @override
  BaseScreenState createState() => _DetailPageState();
}

class _DetailPageState extends BaseScreenState<DetailPage,
    DetailDiscoveryViewModel, DetailDiscoveryState> {
  Location? location;
  // Activity? activities;
  // List<DocumentSnapshot>?
  //     activityDocuments;

  // final DiscoveryController discoveryController =
  //     Get.put(DiscoveryController());
  @override
  Widget buildBody(BuildContext context) {
    final location = ModalRoute.of(context)!.settings.arguments as Location;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.maxFinite,
          height: 940,
          child: Stack(
            children: [
              // ảnh
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 400,
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
              Positioned(
                top: 200,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 180,
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
                        ref.appLocalizations.moTa,
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
                top: 370,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ref.appLocalizations.hoatDong,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        Container(
                          constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width),
                          child: Wrap(
                            children: location.activity!.map((activity) {
                              return Container(
                                margin: const EdgeInsets.only(right: 5),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 6),
                                child: Text(
                                  activity,
                                  style: const TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 450,
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 220,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: const SliderImageActivity(),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 720, left: 20),
                child: Text(
                  ref.appLocalizations.khachSanGanDo,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Positioned(
                top: 680,
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  width: MediaQuery.of(context).size.width,
                  height: 270,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: ListViewHotelNear(location.provinceName!),
                ),
              ),
            ],
          ),
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
