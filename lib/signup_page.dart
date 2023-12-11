// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:uasmobile/home_page.dart';
import 'package:uasmobile/login_page.dart';
import 'package:uasmobile/services/firebase_auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void register() async {
    String email = _emailController.text;
    String password = _passwordController.text;
    User? user =
        await _authService.signUpWithEmailandPassword(email, password, context);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("User is successfully created"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Cannot create user"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAF2FE),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(48, 84, 48, 24),
          child: Column(
            children: [
              Image.asset('images/monitor.png'),
              SizedBox(
                height: 84,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Color(0xff135699),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(IconlyBold.profile,
                            size: 24, color: Color(0xff135699)),
                        SizedBox(
                          width: 12,
                        ),
                        Flexible(
                          child: TextField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Username',
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff135699),
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff135699),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          IconlyBold.password,
                          size: 24,
                          color: Color(0xff135699),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Flexible(
                          child: TextField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff135699),
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xff135699),
                                ),
                              ),
                              suffixIcon: Icon(IconlyBold.hide),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  'By signing up, you’re agree to our Terms & Conditions and Privacy Police',
                  style: TextStyle(
                    color: Color(0xff135699),
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff3ABEDA),
                      minimumSize: Size(480, 50)),
                  onPressed: () {
                    register();
                  },
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 72,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(color: Color(0xff135699), fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Color(0xff135699),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
