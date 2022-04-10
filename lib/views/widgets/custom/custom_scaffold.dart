/* ************************************************************************
* Directory Name: widgets                                                 *
* File Name: custom_scaffold.dart                                         *
* Created At: Saturday, 9th April 2022 10:13:37 am                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Color? backgroundColor;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget child;

  const CustomScaffold({
    Key? key,
    this.backgroundColor,
    this.appBar,
    this.drawer,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        drawer: drawer,
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: child,
        ),
      ),
    );
  }
}
