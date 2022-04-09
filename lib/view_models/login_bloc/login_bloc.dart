import 'package:equatable/equatable.dart';
import 'package:flutter_firebase/helpers/index.dart';

import 'package:flutter_firebase/services/index.dart';
import 'package:flutter_firebase/view_models/index.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo loginRepo;
  LoginBloc({
    required this.loginRepo,
  }) : super(const LoginState()) {
    on<CheckAuthenticationEvent>((event, emit) async {
      emit(state.copyWith(isAuthenticateStatus: EventLoading()));
      try {
        //call ApiService
        bool result = await SharedPref.getBool(key: SharedPref.prefAuth);
        emit(
          state.copyWith(
            isAuthenticate: result,
            isAuthenticateStatus:
                const EventLoaded(successMessage: "Authenticate scuccess"),
          ),
        );
      } on BaseException catch (e) {
        emit(state.copyWith(
            isAuthenticateStatus: EventFailed(errorMessage: e.message)));
      }
    });
  }
}
