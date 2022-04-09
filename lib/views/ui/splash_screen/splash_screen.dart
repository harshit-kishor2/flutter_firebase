/* ************************************************************************
* Directory Name: splash_screen                                           *
* File Name: splash_screen.dart                                           *
* Created At: Saturday, 9th April 2022 9:05:37 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/widgets/custom/custom_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("SplashScreen"),
        ],
      ),
    );
  }
}
