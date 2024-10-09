abstract class AuthRepository {
  Future<Map<String, dynamic>> login(String email);
  Future<Map<String, dynamic>> verifyOtp(String otp, String fingerPrint);
}
