import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helpers/index.dart';

part 'app_config_state.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit() : super(const AppConfigState());

  changeTheme() {
    emit(state.copyWith(isDark: !state.isDark));
  }

  checkAuthentication() async {
    bool result = await SharedPref.getBool(key: SharedPref.prefAuth);
    emit(state.copyWith(isAuth: result));
  }
}
