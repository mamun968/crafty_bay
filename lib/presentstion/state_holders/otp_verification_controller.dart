import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/model/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class OtpVerificationController extends GetxController {
  bool _otpVerificationInProgress = false;
  String _message = '';

  bool get otpVerificationInProgress => _otpVerificationInProgress;

  String get message => _message;

  Future<bool> otpController(String email, String otp) async {
    _otpVerificationInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.verifyOTP(email, otp));
    _otpVerificationInProgress = false;
    update();
    if (response.isSuccess) {
      _message = response.responseJson?['data'] ?? '';
      return true;
    } else {
      return false;
    }
  }
}
