/* ************************************************************************
* Directory Name: custom                                                  *
* File Name: custom_button.dart                                           *
* Created At: Sunday, 10th April 2022 12:19:57 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget buttonLabel;
  final double height = 40;
  final double width = 80;
  final Color color = Colors.blue;
  final void Function()? onTap;
  const CustomButton({
    Key? key,
    required this.buttonLabel,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: buttonLabel,
          ),
        ),
      ),
    );
  }
}
