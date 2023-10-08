import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_application_1/network/authentication.dart';
import 'package:flutter_application_1/providers/user_provider.dart';
import 'package:flutter_application_1/screens/forgot_password.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0822),
      body: Center(
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
                    hintText: 'Email',
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    showDialog(
                        context: context,
                        builder: ((context) => const Dialog(
                              child: SizedBox(
                                  height: 250,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    color: Color(0xFF0D0822),
                                  ))),
                            )));
                    Authentication()
                        .signIn(
                            email: _usernameController.text,
                            password: _passwordController.text)
                        .then((value) {
                      if (value!.emailVerified) {
                        UserModel u = UserModel(
                            email: value.email!,
                            password: _passwordController.text,
                            name: value.displayName!,
                            uid: value.uid);
                        Provider.of<UserProvider>(context, listen: false)
                            .setUser(u);
                        Navigator.pushNamed(context, '/home');
                      } else {
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
                                                'lib/assets/info.gif'),
                                            height: 130,
                                            width: 130,
                                          ),
                                          SizedBox(height: 10),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Please verify your email for using this app',
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
                      }
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
                child: const Text('Log In'),
              ),
              const SizedBox(height: 10.0), // Add some spacing
              TextButton(
                onPressed: () {
                  // Navigate to the sign-up screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) =>
                              const ForgotPasswordScreen())));
                },
                child: const Text("Doesn't remember password? Reset password"),
              ),
              const SizedBox(height: 10.0), // Add some spacing
              TextButton(
                onPressed: () {
                  // Navigate to the sign-up screen
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text("Don't have an account? Create an account"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
