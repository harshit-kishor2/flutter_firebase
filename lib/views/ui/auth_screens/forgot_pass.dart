/* ************************************************************************
* Directory Name: auth_screens                                            *
* File Name: forgot_pass.dart                                             *
* Created At: Saturday, 9th April 2022 12:43:45 pm                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/index.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: const [
          Text("Forgot"),
        ],
      ),
    );
  }
}
