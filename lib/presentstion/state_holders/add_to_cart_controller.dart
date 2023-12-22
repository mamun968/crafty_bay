import 'dart:core';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/model/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class AddToCartController extends GetxController {
  bool _isAddToCartInProgress = false;
  String _message = '';
  bool get isAddToCartInProgress => _isAddToCartInProgress;

  String get message => _message;

  Future <bool> addToACart (int productId , String color , String size) async {
    _isAddToCartInProgress = true;
    update();
      final NetworkResponse response = await NetworkCaller.postRequest(Urls.addToCart, {
      "product_id": productId,
      "color": color,
      "size": size
    });
    _isAddToCartInProgress = false;
    update();
    if (response.isSuccess) {
      return true;
    } else {
      _message = 'Add to cart failed! Try again';
      return false;
    }
  }

  }
  
 

