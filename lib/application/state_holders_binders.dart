import 'package:craftybay_app/presentstion/state_holders/bottom_nav_controller.dart';
import 'package:craftybay_app/presentstion/state_holders/home_slider_controller.dart';
import 'package:craftybay_app/presentstion/state_holders/new_product_controller.dart';
import 'package:craftybay_app/presentstion/state_holders/popular_product_controller.dart';
import 'package:craftybay_app/presentstion/state_holders/special_product_controller.dart';
import 'package:get/get.dart';

import '../presentstion/state_holders/add_to_cart_controller.dart';
import '../presentstion/state_holders/catagory_controller.dart';
import '../presentstion/state_holders/email_verification_controller.dart';
import '../presentstion/state_holders/otp_verification_controller.dart';
import '../presentstion/state_holders/product_details_controller.dart';

class StateHoldersBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavScreenController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(HomeSlidersController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());



  }
}
