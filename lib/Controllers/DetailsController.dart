import 'package:get/get.dart';

class DetailController extends GetxController{
  bool love = false;

  void loveDetector() {
    love = !love;
    update();
  }
}