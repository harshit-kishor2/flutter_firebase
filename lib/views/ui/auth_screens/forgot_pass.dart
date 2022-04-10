/* ************************************************************************
* Directory Name: auth_screens                                            *
* File Name: forgot_pass.dart                                             *
* Created At: Saturday, 9th April 2022 12:43:45 pm                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/router_generator.dart';
import 'package:flutter_firebase/view_models/index.dart';
import 'package:flutter_firebase/views/index.dart';
import 'package:flutter_firebase/views/widgets/custom/custom_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: CustomScaffold(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.forgotPasswordStatus is EventLoaded) {
              setState(() {
                _emailController.text = '';
              });
              ToastMessage.success(
                  "Link sent at your email for password reset.");
            }
            if (state.forgotPasswordStatus is EventFailed) {
              ToastMessage.error(
                  (state.forgotPasswordStatus as EventFailed).errorMessage);
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
                  Text("Forgot Password",
                      style: Theme.of(context).textTheme.headline5),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: "Have a account? ",
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
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    buttonLabel: const Text("Send"),
                    onTap: () {
                      context.read<AuthBloc>().add(
                          ForgotPAsswordEvent(email: _emailController.text));
                    },
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
