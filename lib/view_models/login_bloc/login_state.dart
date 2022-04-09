part of 'login_bloc.dart';

class LoginState {
  final bool isAuthenticate;
  final EventStatus isAuthenticateStatus;
  const LoginState({
    this.isAuthenticate = false,
    this.isAuthenticateStatus = const EventNotLoaded(),
  });

  LoginState get initialState => const LoginState();

  LoginState copyWith({
    bool? isAuthenticate,
    EventStatus? isAuthenticateStatus,
  }) {
    return LoginState(
      isAuthenticate: isAuthenticate ?? this.isAuthenticate,
      isAuthenticateStatus: isAuthenticateStatus ?? this.isAuthenticateStatus,
    );
  }

  @override
  String toString() =>
      'LoginState(isAuthenticate: $isAuthenticate, isAuthenticateStatus: $isAuthenticateStatus)';
}
