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
import 'package:flutter_firebase/view_models/index.dart';
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
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthBlocInitialEvent());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: CustomScaffold(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.loginStatus is EventLoaded) {
              setState(() {
                _emailController.text = '';
                _passController.text = '';
              });
              ToastMessage.success("Login Successfully");
              Navigator.pushReplacementNamed(context, RoutesConst.dashboard);
            }
            if (state.loginStatus is EventFailed ||
                state.googleLoinStatus is EventFailed) {
              ToastMessage.error(
                  (state.loginStatus as EventFailed).errorMessage);
            }
            if (state.googleLoinStatus is EventLoaded) {
              ToastMessage.success("Google Login Successfully");
              Navigator.pushReplacementNamed(context, RoutesConst.dashboard);
            }
          },
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
                    onTap: () {
                      context.read<AuthBloc>().add(LoginEvent(
                          email: _emailController.text,
                          password: _passController.text));
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(GoogleSigninEvent());
                    },
                    icon: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png",
                      height: 30,
                      width: 30,
                    ),
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
      ),
    );
  }
}
