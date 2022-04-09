/* ************************************************************************
* Directory Name: widgets                                                 *
* File Name: drawer.dart                                                  *
* Created At: Saturday, 9th April 2022 10:40:01 am                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/router_generator.dart';
import 'package:flutter_firebase/views/index.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  final List<dynamic> menuList = menus;

  @override
  _MyDrawer createState() => _MyDrawer();
}

class _MyDrawer extends State<MyDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      for (int i = 0; i < widget.menuList.length; i++) {
        if (ModalRoute.of(context)!.settings.name ==
            widget.menuList[i]['route']) {
          widget.menuList[i]['active'] = true;
        } else {
          widget.menuList[i]['active'] = false;
        }
      }
    });
    return Drawer(
      child: Container(
        color: ConstColors.background,
        constraints: const BoxConstraints.expand(),
        child: _handleBuilder(),
      ),
    );
  }

  Widget _handleBuilder() {
    return SingleChildScrollView(
      child: Column(children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: ConstColors.secondary.withOpacity(0.5)),
              margin: EdgeInsets.zero,
              accountName: const Text("Test User"),
              accountEmail: const Text('abc@gmail.com'),
              /* accountEmail: CustomWidgets.text(
                  roleDeatils?.shopName ?? '',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ), */
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const CustomNetworkImage(
                  image: '',
                  onError: Icon(Icons.error),
                ),
              ),
            )),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.menuList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, widget.menuList[index]['route']);
              },
              child: Container(
                color: widget.menuList[index]['active']
                    ? ConstColors.secondary.withOpacity(0.1)
                    : ConstColors.background,
                child: ListTile(
                  leading: Icon(
                    widget.menuList[index]['icon'],
                    color: Colors.black,
                  ),
                  title: Text(
                    widget.menuList[index]['name'],
                  ),
                ),
              ),
            );
          },
        ),
        const Divider(),
        GestureDetector(
          onTap: () {
            ToastMessage.showAlertDialog(
              context,
              title: "Logout",
              message: "Are you sure want to logout ?",
              onTap: () {
                printError("Logout");
              },
            );
          },
          child: const ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.black,
              ),
              title: Text("Logout")),
        ),
      ]),
    );
  }
}

List<Map<String, dynamic>> menus = [
  {
    'name': 'Live Chat',
    'icon': Icons.chat,
    'route': RoutesConst.splash,
    'active': false,
  },
  {
    'name': 'Edit Profile',
    'icon': Icons.verified_user,
    'route': RoutesConst.splash,
    'active': false,
  },
  {
    'name': 'Change Password',
    'icon': Icons.security,
    'route': RoutesConst.splash,
    'active': false,
  },
];
