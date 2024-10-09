import '../repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<Map<String, dynamic>> call(String otp,String fingerPrint) {
    return repository.verifyOtp(otp,fingerPrint);
  }
}
