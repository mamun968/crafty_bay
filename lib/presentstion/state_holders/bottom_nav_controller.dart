import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomNavScreenController extends GetxController{
  int currentSelectedIndex = 0;

  void changeScreen(int index) {
    currentSelectedIndex = index;
    update();
  }

  void backToHome() {
    changeScreen(0);
  }
}