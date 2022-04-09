import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'app_config_state.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit() : super(const AppConfigState());

  changeTheme() {
    emit(state.copyWith(isDark: !state.isDark));
  }
}
