part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class RegisterEvent extends AuthEvent {
  final String email;
  final String name;
  final String password;
  const RegisterEvent({
    required this.email,
    required this.name,
    required this.password,
  });
  @override
  List<Object> get props => [email, name, password];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}

class ForgotPAsswordEvent extends AuthEvent {
  final String email;
  const ForgotPAsswordEvent({
    required this.email,
  });
  @override
  List<Object> get props => [email];
}

class LogoutEvent extends AuthEvent {}

class GoogleSigninEvent extends AuthEvent {}
