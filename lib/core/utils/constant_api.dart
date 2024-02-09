class ConstantApi {
  static const String baseUrl =
      'https://morabrand.net/monasbatech/public/api/';

  static const String login = "${baseUrl}auth/login";
  static const String signUp = "${baseUrl}auth/signUp";
  static const String sendCode = "${baseUrl}auth/sendPasswordResetEmail";
  static const String verifyCode = "${baseUrl}auth/verifyCode";
  static const String changePassword = "${baseUrl}auth/changePassword";

  static const String email = "email";
  static const String password = "password";
}
