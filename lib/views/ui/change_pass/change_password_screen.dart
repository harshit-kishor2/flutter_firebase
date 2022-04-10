/* ************************************************************************
* Directory Name: change_pass                                             *
* File Name: change_password_screen.dart                                  *
* Created At: Sunday, 10th April 2022 6:58:35 pm                          *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/view_models/index.dart';
import 'package:flutter_firebase/views/index.dart';
import 'package:flutter_firebase/views/widgets/custom/custom_button.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController newPass = TextEditingController();
  final TextEditingController oldPass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

  @override
  void dispose() {
    newPass.dispose();
    oldPass.dispose();
    confirmPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: closeKeyboard,
      child: CustomScaffold(
        drawer: MyDrawer(),
        appBar: const PreferredSize(
          child: CustomAppBar(),
          preferredSize: Size.fromHeight(60),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                EventStatus status = state.changePasswordStatus;
                if (status is EventLoaded) {
                  ToastMessage.success("Password change Successfully");
                  setState(() {
                    newPass.text = '';
                    oldPass.text = '';
                    confirmPass.text = '';
                  });
                }
                if (status is EventFailed) {
                  ToastMessage.error(
                      ((state.changePasswordStatus as EventFailed)
                          .errorMessage));
                }
              },
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
                  Text("Change Password",
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomInput(
                    controller: oldPass,
                    hintText: "Enter your old password.",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomInput(
                    controller: newPass,
                    hintText: "Enter your new password.",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomInput(
                    controller: confirmPass,
                    hintText: "Enter your confirm password.",
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButton(
                    width: 140,
                    buttonLabel: const Text(
                      "Change Password",
                    ),
                    onTap: () {
                      context.read<AuthBloc>().add(
                            ChangePassEvent(
                              newPassword: newPass.text,
                              password: oldPass.text,
                              confirmPassword: confirmPass.text,
                            ),
                          );
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
