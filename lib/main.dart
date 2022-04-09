import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/injection_container.dart' as di;
import 'package:flutter_firebase/router_generator.dart';
import 'package:flutter_firebase/view_models/index.dart';

import 'views/index.dart';

/// [globalInitializer()]
/// Function to initialise all the pre-app things
globalInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
}

Future<void> main() async {
  await globalInitializer();
  BlocOverrides.runZoned(
    () {
      runApp(
        const MyApp(),
      );
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: ConstColors.background,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark),
    );
    return MyBlocProvider(
      child: MaterialApp(
        title: ConstStrings.appName,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesConst.generateRoute,
        theme: MyTheme.lightTheme(context),
        darkTheme: MyTheme.darkTheme(context), // for global theme
        home: const SplashScreen(),
      ),
    );
  }
}
