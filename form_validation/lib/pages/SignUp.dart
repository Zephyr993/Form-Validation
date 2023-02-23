import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late FocusNode myFocusName = FocusNode();
  late FocusNode myFocusPhone = FocusNode();
  late FocusNode myFocusEmail = FocusNode();
  late FocusNode myFocusPassword = FocusNode();
  late FocusNode myFocusConfirmPassword = FocusNode();
  bool focusedName = false;
  bool focusedPhone = false;
  bool focusedEmail = false;
  bool focusedPassword = false;
  bool focusedConfirmPassword = false;
  Color _focusedColor = Color.fromRGBO(56, 48, 77, 1);
  Color _unFocusedText = Colors.grey;

  @override
  void initState() {
    super.initState();
    print("hell0");
    myFocusName = FocusNode();
    myFocusEmail = FocusNode();
    myFocusPhone = FocusNode();
    myFocusPassword = FocusNode();
    myFocusConfirmPassword = FocusNode();
    myFocusName.addListener(_focusChange);
    myFocusPhone.addListener(_focusChange);
    myFocusEmail.addListener(_focusChange);
    myFocusPassword.addListener(_focusChange);
    myFocusConfirmPassword.addListener(_focusChange);
  }

  @override
  void dispose() {
    myFocusName.removeListener(_focusChange);
    myFocusPassword.removeListener(_focusChange);
    myFocusConfirmPassword.removeListener(_focusChange);
    myFocusEmail.removeListener(_focusChange);
    myFocusPhone.removeListener(_focusChange);
    super.dispose();
  }

  void _focusChange() {
    if (myFocusName.hasFocus) {
      setState(() {
        focusedName = true;
      });
    } else {
      setState(() {
        focusedName = false;
      });
    }
    if (myFocusConfirmPassword.hasFocus) {
      setState(() {
        focusedConfirmPassword = true;
      });
    } else {
      setState(() {
        focusedConfirmPassword = false;
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
    if (myFocusPhone.hasFocus) {
      setState(() {
        focusedPhone = true;
      });
    } else {
      setState(() {
        focusedPhone = false;
      });
    }
    if (myFocusEmail.hasFocus) {
      setState(() {
        focusedEmail = true;
      });
    } else {
      setState(() {
        focusedEmail = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(33, 27, 49, 1),
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 20, top: 10, right: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: Icon(Icons.keyboard_backspace,
                          size: 35, color: Color.fromRGBO(143, 141, 147, 1)),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Create Account",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Poppins"),
                  ),
                  Text(
                    "Please fill the input below",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    focusNode: myFocusName,
                    autofocus: true,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      labelStyle: TextStyle(color: _unFocusedText),
                      prefixIcon: Icon(
                        Icons.person,
                        color: focusedName ? Colors.white : _unFocusedText,
                        size: 25,
                      ),
                      filled: focusedName,
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
                    focusNode: myFocusPhone,
                    autofocus: false,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      labelText: 'Phone',
                      labelStyle: TextStyle(color: _unFocusedText),
                      prefixIcon: Icon(
                        Icons.phone_android,
                        color: focusedPhone ? Colors.white : _unFocusedText,
                        size: 25,
                      ),
                      filled: focusedPhone,
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
                    focusNode: myFocusEmail,
                    autofocus: false,
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
                  TextFormField(
                    focusNode: myFocusConfirmPassword,
                    autofocus: false,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(color: _unFocusedText),
                      prefixIcon: Icon(
                        Icons.password,
                        color: focusedConfirmPassword
                            ? Colors.white
                            : _unFocusedText,
                        size: 25,
                      ),
                      filled: focusedConfirmPassword,
                      fillColor: _focusedColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Column(children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 70, vertical: 15),
                            backgroundColor: Color.fromRGBO(13, 245, 227, 1)),
                        onPressed: () {},
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(33, 27, 49, 1),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have a account ? ",
                            style:
                                TextStyle(fontSize: 16, color: _unFocusedText),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          GestureDetector(
                            onTap: () => {Navigator.pop(context)},
                            child: Text("Sign In",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color.fromRGBO(13, 245, 227, 1))),
                          ),
                        ],
                      ),
                    ]),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
