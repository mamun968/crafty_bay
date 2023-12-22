class Urls {
  static const String _baseUrl = 'https://craftybay.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';
  static String verifyOTP(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';

  static String homeSliders = '$_baseUrl/ListProductSlider';
  static String getCatagory = '$_baseUrl/CategoryList';
  static String getProductByRemarks(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';
  static String getProductDetails(int productId) => '$_baseUrl/ProductDetailsById/$productId';
   static const String addToCart = '$_baseUrl/CreateCartList';
}
