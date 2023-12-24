import 'package:craftybay_app/data/model/product_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/model/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class ProductListController extends GetxController {
  bool _getProductListInProgress = false;
  ProductModel _productModel = ProductModel();
  String _message = '';

  ProductModel get productModel => _productModel;

  bool get getCategoriesInProgress => _getProductListInProgress;

  String get message => _message;

  Future<bool> getProductListByCategory( int categoryId, ) async {
   _getProductListInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductByCategory(categoryId));
   _getProductListInProgress = false;
    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Product list data fetch failed!';
      update();
      return false;
    }
  }

  void setProducts(ProductModel productModel) {
    _productModel = productModel;
    update();
  }
}