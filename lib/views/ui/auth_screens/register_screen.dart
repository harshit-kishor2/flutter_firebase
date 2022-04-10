/* ************************************************************************
* Directory Name: auth_screens                                            *
* File Name: register_screen.dart                                         *
* Created At: Saturday, 9th April 2022 12:43:03 pm                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/router_generator.dart';
import 'package:flutter_firebase/views/index.dart';
import 'package:flutter_firebase/views/widgets/custom/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
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
                Text("Register", style: Theme.of(context).textTheme.headline5),
                const SizedBox(
                  height: 15,
                ),
                CustomInput(
                  controller: _nameController,
                  hintText: "Enter your name.",
                ),
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
                CustomButton(
                  buttonLabel: const Text("Register"),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                Text.rich(
                  TextSpan(
                    text: "Already have a account? ",
                    children: [
                      TextSpan(
                        text: "Login",
                        style: const TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                                context, RoutesConst.login);
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
