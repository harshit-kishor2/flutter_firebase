/* ************************************************************************
* Directory Name: login_screen                                            *
* File Name: login_screen.dart                                            *
* Created At: Saturday, 9th April 2022 12:34:52 pm                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helpers/index.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              CustomButton(
                buttonLabel: const Text("Submit"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
