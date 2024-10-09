import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_chat_app_with_graphql/utils/size_utils.dart';
import '../../theme/theme_helper.dart';

import '../controllers/auth_controller.dart';

class LoginPage extends StatelessWidget {
  final AuthController controller = Get.find();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login',style: TextStyle(color: Colors.white),),backgroundColor: appTheme.green200,),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.emailController,
                  // hintText: "Email",
                  decoration: InputDecoration(
                    hintText: "Email",
                    isDense: true,
                    fillColor: Colors.white,
                    filled: true,
                    errorMaxLines: 3,
                    border:
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.h),
                          borderSide: BorderSide(
                            color: appTheme.blueGray100,
                            width: 1,
                          ),
                        ),
                    enabledBorder:
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.h),
                          borderSide: BorderSide(
                            color: appTheme.blueGray100,
                            width: 1,
                          ),
                        ),
                    focusedBorder:
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.h),
                          borderSide: BorderSide(
                            color: appTheme.blueGray100,
                            width: 1,
                          ),
                        ),
                  ),
                  validator: (value) {
                    if (value == null || (!isValidEmail(value, isRequired: true))) {
                      return "Please Enter Valid Email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const CircularProgressIndicator();
                  } else {
                    return InkWell(
                      onTap: (){
                        if (_formKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                          height:  48.v,
                          width:  double.maxFinite,
                         
                          decoration: BoxDecoration( color: appTheme.green200,borderRadius: BorderRadius.circular(10) ),
                          child: const Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String value, {bool isRequired = true}) {
    if (isRequired && value.isEmpty) {
      return false;
    }
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(value);
  }
}
