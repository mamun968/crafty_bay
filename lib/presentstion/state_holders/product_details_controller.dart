import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/model/network_response.dart';
import '../../data/model/product_details.dart';
import '../../data/model/product_details_model.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsInProgress = false;
  ProductDetails _productDetails = ProductDetails();
  String _errorMessage = '';
  final List<String> _availableColors = [];

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  ProductDetails get productDetails => _productDetails;

  List<String> get availableColors => _availableColors;

  String get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int id) async {
    _getProductDetailsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getProductDetails(id));
    _getProductDetailsInProgress = false;
    if (response.isSuccess) {
      _productDetails =
          (ProductDetailsModel.fromJson(response.responseJson ?? {}))
              .data!
              .first;
      _convertStringToColor(_productDetails.color ?? '');
      update();
      return true;
    } else {
      _errorMessage = 'Fetch product details has been failed! Try again.';
      update();
      return false;
    }
  }

  void _convertStringToColor(String color) {
    availableColors.clear();
    final List<String> splittedColors = color.split(',');
    for (String c in splittedColors) {
      if (c.isNotEmpty) {
        _availableColors.add(c);
      }
    }
  }
}