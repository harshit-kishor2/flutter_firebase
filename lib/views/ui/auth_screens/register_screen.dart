/* ************************************************************************
* Directory Name: auth_screens                                            *
* File Name: register_screen.dart                                         *
* Created At: Saturday, 9th April 2022 12:43:03 pm                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/index.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: const [
          Text("Register"),
        ],
      ),
    );
  }
}
