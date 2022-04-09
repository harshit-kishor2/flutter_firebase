/* ************************************************************************
* Directory Name: custom                                                  *
* File Name: custom_appbar.dart                                           *
* Created At: Saturday, 9th April 2022 5:01:48 pm                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/generated/l10n.dart';
import 'package:flutter_firebase/view_models/index.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigCubit, AppConfigState>(
      builder: (context, state) {
        return AppBar(
          title: Text(S.of(context).greet),
          actions: [
            Switch(
                value: state.isDark,
                onChanged: (v) {
                  context.read<AppConfigCubit>().changeTheme();
                })
          ],
        );
      },
    );
  }
}
