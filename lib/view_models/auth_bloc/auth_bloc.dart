import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_firebase/helpers/index.dart';

import 'package:flutter_firebase/services/repos/login_repo.dart';
import 'package:flutter_firebase/view_models/event_status.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc({
    required this.authRepo,
  }) : super(const AuthState()) {
    on<AuthEvent>((event, emit) async {
      //!RegisterEvent
      if (event is RegisterEvent) {
        emit(
          state.copyWith(registerStatus: EventLoading()),
        );
        try {
          if (event.email.isEmpty) {
            throw const BaseException(message: "Enter your email !");
          } else if (event.password.isEmpty) {
            throw const BaseException(message: "Enter your password !");
          } else if (!CustomFunctions.isEmailValid(event.email)) {
            throw const BaseException(message: "Invalid email !");
          } else {
            String result = await authRepo.postRegister({
              "email": event.email,
              "password": event.password,
              "name": event.name
            });
            emit(
              state.copyWith(
                  registerStatus:
                      const EventLoaded(successMessage: "Register Success.")),
            );
          }
        } on BaseException catch (e) {
          emit(
            state.copyWith(
                registerStatus: EventFailed(errorMessage: e.message)),
          );
        }
      }
      //!LoginEvent
      if (event is LoginEvent) {
        emit(
          state.copyWith(loginStatus: EventLoading()),
        );
        try {
          if (event.email.isEmpty) {
            throw const BaseException(message: "Enter your email !");
          } else if (event.password.isEmpty) {
            throw const BaseException(message: "Enter your password !");
          } else if (!CustomFunctions.isEmailValid(event.email)) {
            throw const BaseException(message: "Invalid email !");
          } else {
            String result = await authRepo.postLogin({
              "email": event.email,
              "password": event.password,
            });
            emit(
              state.copyWith(
                  loginStatus:
                      const EventLoaded(successMessage: "Login Success.")),
            );
          }
        } on BaseException catch (e) {
          emit(
            state.copyWith(loginStatus: EventFailed(errorMessage: e.message)),
          );
        }
      }
      //!ForgotPAsswordEvent
      if (event is ForgotPAsswordEvent) {
        emit(
          state.copyWith(forgotPasswordStatus: EventLoading()),
        );
        try {
          authRepo.postForgotPass({"email": event.email});
          emit(
            state.copyWith(
                forgotPasswordStatus:
                    const EventLoaded(successMessage: "Link sent")),
          );
        } on BaseException catch (e) {
          emit(
            state.copyWith(
                forgotPasswordStatus: EventFailed(errorMessage: e.message)),
          );
        }
      }
      //!LogoutEvent
      if (event is LogoutEvent) {
        emit(
          state.copyWith(logoutStatus: EventLoading()),
        );
        try {
          await authRepo.logoutService();
          emit(
            state.copyWith(
                logoutStatus:
                    const EventLoaded(successMessage: "Logout Successfully")),
          );
        } on BaseException catch (e) {
          emit(
            state.copyWith(logoutStatus: EventFailed(errorMessage: e.message)),
          );
        }
      }
      //!LogoutEvent
      if (event is GoogleSigninEvent) {
        emit(
          state.copyWith(googleLoinStatus: EventLoading()),
        );
        try {
          await authRepo.signInWithGoogle();
          emit(
            state.copyWith(
                googleLoinStatus: const EventLoaded(
                    successMessage: "Google login Successfully")),
          );
        } on BaseException catch (e) {
          emit(
            state.copyWith(
                googleLoinStatus: EventFailed(errorMessage: e.message)),
          );
        }
      }
    });
  }
}
