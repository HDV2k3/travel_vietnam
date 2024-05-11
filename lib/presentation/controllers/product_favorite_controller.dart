import 'package:chandoiqua/data/models/hotel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive/hive.dart';

import '../../core/utils.dart';
import '../../data/services/firebase/product_favorite_service.dart';

class ProductWishListController extends GetxController {
  final Box _observableBox = HotelWishListRepository.getBox();
  Box get observableBox => _observableBox;
  int get productsCount => _observableBox.length;
  init() {
    getProducts();
  }

  addProduct(Hotel product, BuildContext context) {
    _observableBox.add(product);
    showSnackBar(context, "Product added to wishlist");
    update();
  }

  getProducts() {
    _observableBox;
  }

  deleteProduct(int index, BuildContext context) {
    _observableBox.deleteAt(index);
    showSnackBar(context, "Product $index removed from wishlist");
    update();
  }
}
