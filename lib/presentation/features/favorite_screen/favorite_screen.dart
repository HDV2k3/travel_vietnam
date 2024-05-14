import 'package:chandoiqua/presentation/common_widgets/base/base_screen.dart';
import 'package:chandoiqua/presentation/features/favorite_screen/favorite_state.dart';
import 'package:chandoiqua/presentation/features/favorite_screen/favorite_view_model.dart';
import 'package:chandoiqua/utilities/extensions/widget_ref_extension.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import '../../../data/repositories/discovery_repository.dart';
import '../../../data/repositories/user_repository.dart';
import 'model/favorite.dart';

class FavoriteScreen extends BaseScreen {
  const FavoriteScreen({super.key});

  @override
  BaseScreenState createState() => _DiscoveryState();
}

class _DiscoveryState
    extends BaseScreenState<FavoriteScreen, FavoriteViewModel, FavoriteState> {
  final DiscoveryController discoveryController =
      Get.put(DiscoveryController());
  final UserController userController = Get.put(UserController());

  @override
  Color? get backgroundColor => ref.colors.background;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Mục Yêu Thích'),
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.notifications,
            color: Colors.pink,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      loadFavoriteItems(); // Gọi hàm loadFavoriteItems để tải danh sách yêu thích
    } else {
      // Người dùng chưa đăng nhập
    }
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: DiscoveryController.getFavorite(
            user?.uid), // Truyền UID của người dùng vào stream
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            final favorites = snapshot.data!.docs
                .map((doc) => Favorites.fromFirebase(doc))
                .toList();
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (BuildContext context, int index) {
                final favorite = favorites[index];
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
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                child: Image.network(
                                  favorite.image,
                                  fit: BoxFit.cover,
                                  height: 200,
                                  width: 180,
                                ),
                              ),
                            ),
                            Text(
                              favorite.title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 20, right: 100, top: 30),
                            width: 215,
                            height: 200,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            size: 15,
                                            Icons.location_on,
                                            color: Colors.blue,
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                            child: Text(
                                              favorite.location,
                                              style: TextStyle(
                                                color: Colors.black54
                                                    .withOpacity(0.8),
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Divider(
                                              thickness: 0.7,
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        favorite.price,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          discoveryController
                                              .removeFromFavorite(
                                                  favorite.title);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            // Xử lý lỗi (nếu có)
            return const Text('Error loading data');
          } else {
            // Hiển thị loading hoặc placeholder khi chưa có dữ liệu
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }

  void loadFavoriteItems() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await discoveryController.fetchFavoriteItems(user.uid);
      // Xử lý danh sách yêu thích đã tải
      // ...
    } else {
      // Người dùng chưa đăng nhập
    }
  }

  @override
  // TODO: implement state
  AsyncValue<FavoriteState> get state => ref.watch(favoriteViewModelProvider);

  @override
  // TODO: implement viewModel
  FavoriteViewModel get viewModel =>
      ref.read(favoriteViewModelProvider.notifier);
}
