import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool obscurePassword = true.obs;
  final RxBool keepMeSignedIn = false.obs;
  final RxBool emailSpecialPricing = true.obs;

  void toggleObscurePassword() => obscurePassword.value = !obscurePassword.value;
  void toggleKeepMeSignedIn(bool? value) => keepMeSignedIn.value = value ?? false;
  void toggleEmailSpecialPricing(bool? value) => emailSpecialPricing.value = value ?? false;

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) return 'Please enter your name';
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Please enter your email';
    if (!value.contains('@') || !value.contains('.')) return 'Enter a valid email address';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter a password';
    if (value.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  void createAccount() {
    if (!formKey.currentState!.validate()) return;
    Get.toNamed(Routes.verificationCode, arguments: Routes.signupProcess);
  }

  void goToSignIn() => Get.toNamed(Routes.signIn);

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
