import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_validation/pages/HomePage.dart';
import 'package:form_validation/pages/SignUp.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode myFocusEmail = FocusNode();
  late FocusNode myFocusPassword = FocusNode();
  bool focusedEmail = false;
  bool focusedPassword = false;

  Color _focusedColor = Color.fromRGBO(56, 48, 77, 1);
  Color _unFocusedText = Colors.grey;

  @override
  void initState() {
    super.initState();
    print("hell0");
    myFocusPassword = FocusNode();
    myFocusEmail = FocusNode();
    myFocusEmail.addListener(_focusChange);
    myFocusPassword.addListener(_focusChange);
  }

  void _focusChange() {
    if (myFocusEmail.hasFocus) {
      setState(() {
        focusedEmail = true;
      });
    } else {
      setState(() {
        focusedEmail = false;
      });
    }

    if (myFocusPassword.hasFocus) {
      setState(() {
        focusedPassword = true;
      });
    } else {
      setState(() {
        focusedPassword = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(33, 26, 49, 1),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/images/login.svg',
              height: 300,
            ),
            Text(
              "Login",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Please fill the input below",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              focusNode: myFocusEmail,
              autofocus: true,
              style: TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: _unFocusedText),
                prefixIcon: Icon(
                  Icons.mail,
                  color: focusedEmail ? Colors.white : _unFocusedText,
                  size: 25,
                ),
                filled: focusedEmail,
                fillColor: _focusedColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              focusNode: myFocusPassword,
              autofocus: false,
              style: TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: _unFocusedText),
                prefixIcon: Icon(
                  Icons.password,
                  color: focusedPassword ? Colors.white : _unFocusedText,
                  size: 25,
                ),
                filled: focusedPassword,
                fillColor: _focusedColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Column(children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                      backgroundColor: Color.fromRGBO(13, 245, 227, 1)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => HomePage())));
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(33, 27, 49, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Forgot Password",
                  style: TextStyle(
                      color: Color.fromRGBO(13, 245, 227, 1),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create a new account ? ",
                      style: TextStyle(fontSize: 16, color: _unFocusedText),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()))
                      },
                      child: Text("Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color.fromRGBO(13, 245, 227, 1))),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      )),
    );
  }
}
