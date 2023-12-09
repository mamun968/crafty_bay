import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../data/model/catagory_model.dart';
import '../../data/model/network_response.dart';
import '../../data/utility/network_caller.dart';
import '../../data/utility/urls.dart';

class CategoryController extends GetxController {
  bool _getCategoriesInProgress = false;
  CategoryModel _categoryModel = CategoryModel();
  String _message = '';

  CategoryModel get categoryModel => _categoryModel;

  bool get getCategoriesInProgress => _getCategoriesInProgress;

  String get message => _message;

  Future<bool> getCategories() async {
    _getCategoriesInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getCatagory);
    _getCategoriesInProgress = false;
    if (response.isSuccess) {
      _categoryModel = CategoryModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    } else {
      _message = 'Category list data fetch failed!';
      update();
      return false;
    }
  }
}