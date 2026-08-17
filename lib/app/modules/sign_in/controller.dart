import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../routes/app_routes.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool obscurePassword = true.obs;

  void toggleObscurePassword() => obscurePassword.value = !obscurePassword.value;

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Please enter your email';
    if (!value.contains('@') || !value.contains('.')) return 'Enter a valid email address';
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter your password';
    return null;
  }

  void signIn() {
    if (!formKey.currentState!.validate()) return;
    GetStorage().write('onboarding_seen', true);
    Get.offAllNamed(Routes.home);
  }

  void forgotPassword() => Get.toNamed(Routes.viaMethod);

  void goToSignUp() => Get.toNamed(Routes.signUp);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
