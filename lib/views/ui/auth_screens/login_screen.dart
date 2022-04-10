/* ************************************************************************
* Directory Name: login_screen                                            *
* File Name: login_screen.dart                                            *
* Created At: Saturday, 9th April 2022 12:34:52 pm                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/router_generator.dart';
import 'package:flutter_firebase/views/index.dart';
import 'package:flutter_firebase/views/widgets/custom/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: CustomScaffold(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtils.hp(15, context),
                ),
                Icon(
                  Icons.security,
                  size: 80,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text("Login", style: Theme.of(context).textTheme.headline5),
                const SizedBox(
                  height: 15,
                ),
                CustomInput(
                  controller: _emailController,
                  hintText: "Enter your email.",
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomInput(
                  controller: _passController,
                  hintText: "Enter your password.",
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Forgot Password? ",
                        style: const TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                                context, RoutesConst.forgotPassword);
                          },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  buttonLabel: const Text("Login"),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(
                    text: "Not have a account? ",
                    children: [
                      TextSpan(
                        text: "Register",
                        style: const TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                                context, RoutesConst.register);
                          },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
