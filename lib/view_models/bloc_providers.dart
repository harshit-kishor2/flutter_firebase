/* ************************************************************************
* Directory Name: view_models                                             *
* File Name: bloc_providers.dart                                          *
* Created At: Saturday, 9th April 2022 9:29:32 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/injection_container.dart' as sl;
import 'package:flutter_firebase/view_models/index.dart';

class MyBlocProvider extends StatelessWidget {
  final Widget child;
  const MyBlocProvider({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context) => sl.di<LoginBloc>()),
      ],
      child: child,
    );
  }
}
