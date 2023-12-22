
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomNavScreenController extends GetxController {
  int currentSelectedIndex = 0;
  bool isVisible = true;
  double scrollPosition = 0.0;

  void handleScroll(double position) {
    scrollPosition = position;
    if (position > 0 && position > position) {
      isVisible = false;
      update();
    } else {
      isVisible = true;
      update();
    }
  }

  void changeScreen(int index) {
    currentSelectedIndex = index;
    update();
  }

  void backToHome() {
    changeScreen(0);
  }
}
