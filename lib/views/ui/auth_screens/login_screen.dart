/* ************************************************************************
* Directory Name: login_screen                                            *
* File Name: login_screen.dart                                            *
* Created At: Saturday, 9th April 2022 12:34:52 pm                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/index.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: const [
          Text("Login"),
        ],
      ),
    );
  }
}
