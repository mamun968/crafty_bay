import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/model/network_response.dart';
import '../../data/model/product_model.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class PopularProductController extends GetxController {
  bool _getPopularProductInProgress = false;

  ProductModel _popularProductModel = ProductModel();

  String _message = '';

  ProductModel get popularProductModel => _popularProductModel;

  bool get getPopularProductInProgress => _getPopularProductInProgress;

  String get message => _message;

  Future<bool> getPopularProduct() async {
    _getPopularProductInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductByRemarks("popular"));
    _getPopularProductInProgress = false;
    if (response.isSuccess) {
      _popularProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Popular product list data fetch failed!';
      update();
      return false;
    }
  }
}