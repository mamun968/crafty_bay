import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/model/network_response.dart';
import '../../data/model/product_model.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class NewProductController extends GetxController {
  bool _getNewProductInProgress = false;
  ProductModel _newProductModel = ProductModel();
  String _message = '';

  bool get getNewProductInProgress => _getNewProductInProgress;

  ProductModel get newProductModel => _newProductModel;

  String get message => _message;

  Future<bool> getNewProduct() async {
    _getNewProductInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductByRemarks("new"));
    _getNewProductInProgress = false;
    if (response.isSuccess) {
      _newProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'New product list data fetch failed!';
      update();
      return false;
    }
  }
}
