import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sample_chat_app_with_graphql/utils/pref_utils.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/verify_otp_usecase.dart';

class AuthController extends GetxController {
  final LoginUseCase loginUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;

  AuthController({required this.loginUseCase, required this.verifyOtpUseCase});


  var otp = ''.obs;
  var fingerPrint = ''.obs; // New variable for fingerprint
  var isLoading = false.obs;
  var accessToken = ''.obs;
  var refreshToken = ''.obs;
  TextEditingController emailController = TextEditingController();
  Future<void> login() async {
    isLoading.value = true;
    try {
      final result = await loginUseCase(emailController.text);
      if (result != null) {
        fingerPrint.value = result['fingerPrint']; // Capture fingerprint from login response
        PrefUtils().setUserId(result["user"]["id"]);
        Get.toNamed('/verify-otp');  // Navigate to OTP page after successful login
      }
    } catch (e) {
      Get.snackbar("Login Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> verifyOtp() async {
    isLoading.value = true;
    try {
      final result = await verifyOtpUseCase(otp.value, fingerPrint.value); // Pass fingerprint here
      if (result != null) {
        accessToken.value = result['accessToken'];
        refreshToken.value = result['refreshToken'];
        PrefUtils().setAccessToken( accessToken.value);
        Get.offAllNamed('/chat-list');
      }
    } catch (e) {
      e.printError();
      Get.snackbar("OTP Verification Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
