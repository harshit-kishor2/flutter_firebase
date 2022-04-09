/* ************************************************************************
* Directory Name: splash_screen                                           *
* File Name: splash_screen.dart                                           *
* Created At: Saturday, 9th April 2022 9:05:37 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/router_generator.dart';
import 'package:flutter_firebase/view_models/index.dart';
import 'package:flutter_firebase/views/widgets/custom/custom_scaffold.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(CheckAuthenticationEvent());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.isAuthenticateStatus is EventLoaded) {
            if (state.isAuthenticate) {
              Navigator.pushReplacementNamed(context, RoutesConst.dashboard);
            } else {
              Navigator.pushReplacementNamed(context, RoutesConst.login);
            }
          }
          if (state.isAuthenticateStatus is EventFailed) {
            Navigator.pushReplacementNamed(context, RoutesConst.login);
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("SplashScreen"),
          ],
        ),
      ),
    );
  }
}
