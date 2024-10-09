import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});


  @override
  Future<Map<String, dynamic>> verifyOtp(String otp, String fingerPrint) {
    return remoteDataSource.verifyOtp(otp, fingerPrint);
  }

  @override
  Future<Map<String, dynamic>> login(String email) {
    return remoteDataSource.login(email);
  }
}
