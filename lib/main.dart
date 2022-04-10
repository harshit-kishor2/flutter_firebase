import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/injection_container.dart' as di;
import 'package:flutter_firebase/router_generator.dart';
import 'package:flutter_firebase/view_models/index.dart';
import 'package:flutter_firebase/views/index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';

/// [globalInitializer()]
/// Function to initialise all the pre-app things
globalInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyBlocProvider(
      child: BlocBuilder<AppConfigCubit, AppConfigState>(
        builder: (context, state) => MaterialApp(
          title: ConstStrings.appName,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RoutesConst.generateRoute,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme, // for global theme
          themeMode: state.theme,
          home: const SplashScreen(),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ),
      ),
    );
  }
}
