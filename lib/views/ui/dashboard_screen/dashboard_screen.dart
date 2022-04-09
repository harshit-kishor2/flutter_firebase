/* ************************************************************************
* Directory Name: dashboard_screen                                        *
* File Name: dashboard_screen.dart                                        *
* Created At: Saturday, 9th April 2022 12:45:41 pm                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/index.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: const [
          Text("Dashboard"),
        ],
      ),
    );
  }
}
