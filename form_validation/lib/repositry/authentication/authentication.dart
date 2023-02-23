import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:form_validation/pages/HomePage.dart';
import 'package:form_validation/pages/LoginPage.dart';
import 'package:form_validation/repositry/authentication/exceptions/singupexceptions.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  FirebaseAuth _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());

    ever(firebaseUser, _setIntialScreen);
  }

  _setIntialScreen(User? user) {
    user == null ? Get.offAll(() => LoginPage()) : Get.offAll(() => HomePage());
  }

  Future<void> createUser(String name, String email, String password,
      String confirmPassword, String phone) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future<void> signIn(String name, String email, String password,
      String confirmPassword, String phone) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      firebaseUser.value != null
          ? Get.offAll(() => HomePage())
          : Get.offAll(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpError(e.code);

      print(ex.errorMsg);

      throw (ex);
    } catch (_) {
      final ex = SignUpError();
      print(ex.errorMsg);
      throw (ex);
    }
  }
}
