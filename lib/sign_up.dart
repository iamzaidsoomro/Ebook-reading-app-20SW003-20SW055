import 'package:flutter/material.dart';
import 'package:flutter_application_1/network/authentication.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0822),
      body: Builder(
        builder: (BuildContext context) {
          double screenHeight = MediaQuery.of(context).size.height;

          return Center(
            child: SingleChildScrollView(
              child: Container(
                height: screenHeight,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'lib/assets/splash.png',
                        width: 100.0,
                        height: 100.0,
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        width: 300.0,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextFormField(
                          controller: _usernameController,
                          decoration: const InputDecoration(
                            hintText: 'Username',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        width: 300.0,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            } else if (!value.contains('@')) {
                              return 'Invalid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        width: 300.0,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Password',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Container(
                        width: 300.0,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: TextFormField(
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: 'Confirm Password',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Confirm Password is required';
                            } else if (value != _passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Authentication()
                                .signUp(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    username: _usernameController.text)
                                .then((value) {
                              showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0))),
                                        child: SizedBox(
                                          height: 300,
                                          width: 300,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Image(
                                                  image: AssetImage(
                                                      'lib/assets/email_animation.gif'),
                                                  height: 130,
                                                  width: 130,
                                                ),
                                                SizedBox(height: 10),
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    'Verification email has been sent, please verify your email to continue',
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }));
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: const Color(0xFF4738CB),
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: const Text('Sign Up'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
