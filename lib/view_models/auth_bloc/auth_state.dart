part of 'auth_bloc.dart';

class AuthState {
  final EventStatus loginStatus;
  final EventStatus registerStatus;
  final EventStatus forgotPasswordStatus;
  final EventStatus logoutStatus;
  final EventStatus googleLoinStatus;
  final EventStatus changePasswordStatus;
  final String? userDetails;
  const AuthState({
    this.loginStatus = const EventNotLoaded(),
    this.registerStatus = const EventNotLoaded(),
    this.forgotPasswordStatus = const EventNotLoaded(),
    this.logoutStatus = const EventNotLoaded(),
    this.googleLoinStatus = const EventNotLoaded(),
    this.changePasswordStatus = const EventNotLoaded(),
    this.userDetails,
  });

  AuthState get initialState => const AuthState();

  AuthState copyWith({
    EventStatus? loginStatus,
    EventStatus? registerStatus,
    EventStatus? forgotPasswordStatus,
    EventStatus? logoutStatus,
    EventStatus? googleLoinStatus,
    EventStatus? changePasswordStatus,
    String? userDetails,
  }) {
    return AuthState(
      loginStatus: loginStatus ?? this.loginStatus,
      registerStatus: registerStatus ?? this.registerStatus,
      forgotPasswordStatus: forgotPasswordStatus ?? this.forgotPasswordStatus,
      logoutStatus: logoutStatus ?? this.logoutStatus,
      googleLoinStatus: googleLoinStatus ?? this.googleLoinStatus,
      changePasswordStatus: changePasswordStatus ?? this.changePasswordStatus,
      userDetails: userDetails ?? this.userDetails,
    );
  }

  @override
  String toString() {
    return 'AuthState(loginStatus: $loginStatus, registerStatus: $registerStatus, forgotPasswordStatus: $forgotPasswordStatus, logoutStatus: $logoutStatus, googleLoinStatus: $googleLoinStatus, changePasswordStatus: $changePasswordStatus, userDetails: $userDetails)';
  }
}
