import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/model/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class EmailVerificationController extends GetxController {
  bool _emailVerificationInProgress = false;
  String _message = '';

  bool get emailVerificationInProgress => _emailVerificationInProgress;

  String get message => _message;

  Future<bool> emailController(String email) async {
    _emailVerificationInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.verifyEmail(email));
    _emailVerificationInProgress = false;
    update();
    if (response.isSuccess) {
      _message = response.responseJson?['data'] ?? '';
      return true;
    } else {
      return false;
    }
  }
}
