import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_firebase/services/index.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo loginRepo;
  LoginBloc({
    required this.loginRepo,
  }) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {
      //  implement event handler
    });
  }
}
