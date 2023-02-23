import 'package:flutter/material.dart';
import 'package:form_validation/repositry/authentication/authentication.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SingUpController extends GetxController {
  static SingUpController get instance => Get.find();
  final email = TextEditingController();
  final name = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final phone = TextEditingController();

  void registerUser(
    String name,
    String password,
    String confirmPassword,
    String phone,
    String email,
  ) {
    AuthenticationRepo.instance
        .createUser(name, email, password, confirmPassword, phone);
  }
}
