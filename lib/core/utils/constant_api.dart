class ConstantApi {
  static const String baseUrl =
      'https://morabrand.net/monasbatech/public/api/';
static   getImage(String url)=>'https://morabrand.net/monasbatech/public/storage/$url';
  static const String login = "${baseUrl}auth/login";
  static const String signUp = "${baseUrl}auth/signUp";
  static const String sendCode = "${baseUrl}auth/sendPasswordResetEmail";
  static const String verifyCode = "${baseUrl}auth/verifyCode";
  static const String changePassword = "${baseUrl}auth/changePassword";
  static const String category = "${baseUrl}cateogry";
  static   String getSubCategory(String id) => "${baseUrl}SubCategoryByCategory/$id";

  static const String email = "email";
  static const String password = "password";
}
