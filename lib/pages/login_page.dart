import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter_application_1/models/auth.dart';
import 'package:flutter_application_1/pages/main_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:matcher/matcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/bg1.webp",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 48.0,
                    ),
                    const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    const Text("Username", style: TextStyle(fontSize: 16.0)),
                    TextFormField(
                      controller: _usernameController,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    const Text("Password", style: TextStyle(fontSize: 16.0)),
                    TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 48.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_usernameController.text == "" ||
                            _passwordController.text == "") {
                          _showToastMsg("Field harus diisdi", context);
                          return;
                        }

                        Auth auth = Auth(
                            username: _usernameController.text,
                            password: _passwordController.text);

                        if (!auth.checkLogin()) {
                          _showToastMsg(
                              "Username atau Password salah", context);
                          return;
                        }

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => MainPage())));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Center(
                            child: Text(
                          "Login",
                          style: TextStyle(
                              color: (Colors.white),
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          child: Card(
            child: Text("Lupa password"),
          ),
        )
      ],
    );
  }

  _showToastMsg(String msg, BuildContext context) {
    showToast(msg, context: context);
  }

  void showToast(String msg, {required BuildContext context}) {}
}
