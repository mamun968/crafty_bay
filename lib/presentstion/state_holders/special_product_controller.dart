import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/model/network_response.dart';
import '../../data/model/product_model.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class SpecialProductController extends GetxController {
  bool _getSpecialProductInProgress = false;
   ProductModel _specialProductModel = ProductModel();
   String _message = '';
  bool get getSpecialProductInProgress => _getSpecialProductInProgress;

  ProductModel get specialProductModel => _specialProductModel;

  String get message => _message;

  Future<bool> getSpecialProduct() async {
    _getSpecialProductInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductByRemarks("special"));
    _getSpecialProductInProgress = false;
    if (response.isSuccess) {
      _specialProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
       _message = 'Special product list data fetch failed!';
      update();
      return false;
    }
  }
}
