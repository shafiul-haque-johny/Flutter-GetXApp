import 'package:get/get.dart';

class DetailController extends GetxController {
  var fav = 0.obs;

  void favoriteCounter() {
    if (fav.value == 1) {
      Get.snackbar('Loved It!', 'You Already Loved It.');
    } else {
      fav.value++;
      Get.snackbar('Loved It!', 'You Just Loved It.');
    }
  }
}
