import 'package:get/get.dart';

class UserController extends GetxController
{
  // Thuộc tính để lưu ID của người dùng
  RxString userId = ''.obs;

  // Phương thức để cập nhật ID của người dùng
  void updateUserId(String id) {
    userId.value = id;
  }

  // Phương thức để lấy ID của người dùng
  String getUserId() {
    return userId.value;
  }

}