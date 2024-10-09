import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_chat_app_with_graphql/utils/custom_text_form_field.dart';
import '../../theme/theme_helper.dart';
import '../../utils/custom_elevated_button.dart';
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
                CustomTextFormField(
                  controller: controller.emailController,
                  hintText: "Email",
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
                    return CustomElevatedButton(
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                          controller.login();
                        }
                      },
                      text:'Login',
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
