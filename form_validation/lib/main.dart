import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_validation/firebase_options.dart';
import 'package:form_validation/pages/LoginPage.dart';
import 'package:form_validation/pages/SignUp.dart';
import 'package:form_validation/repositry/authentication/authentication.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepo()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Poppins",
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
