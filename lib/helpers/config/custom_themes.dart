/* ************************************************************************
* Directory Name: config                                                  *
* File Name: themes.dart                                                  *
* Created At: Saturday, 9th April 2022 9:35:13 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';

class MyTheme {
  /* Start of MyTheme class */

  //* Light theme setup */
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      );

  //* Dark theme setup */
  static ThemeData darkTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
      );

  /* End of MyTheme class */
}
