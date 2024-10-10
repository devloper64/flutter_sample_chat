import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:sample_chat_app_with_graphql/utils/size_utils.dart';
import '../../theme/theme_helper.dart';
import '../controllers/auth_controller.dart';

class VerifyOtpPage extends StatelessWidget {
  final AuthController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify OTP',style: TextStyle(color: Colors.white),),backgroundColor: appTheme.green200,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OtpTextField(
              numberOfFields: 6,
              fieldWidth: 50.h,
              fieldHeight: 72.h,
              borderColor: appTheme.green50,
              showFieldAsBox: true,
              fillColor:appTheme.green50,
              disabledBorderColor: appTheme.green50,
              enabledBorderColor: appTheme.green50,
              borderRadius: BorderRadius.circular(5),
              filled: true,
              focusedBorderColor: appTheme.green50,
              onCodeChanged: (String code) {
              },
              onSubmit: (String verificationCode){
                controller.otp.value=verificationCode;
              }, // end onSubmit
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.isLoading.value) {
                return const CircularProgressIndicator();
              } else {

                return InkWell(
                  onTap: (){
                    if (controller.otp.value.length<6) {
                      Get.snackbar("Error!","Please enter valid Otp");
                    }else{
                      controller.verifyOtp();

                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height:  48.h,
                    width:  double.maxFinite,
                    decoration: BoxDecoration( color: appTheme.green200,borderRadius: BorderRadius.circular(10) ),
                    child: const Text("Verify Otp",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
