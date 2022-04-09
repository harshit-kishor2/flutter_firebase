part of 'app_config_cubit.dart';

class AppConfigState {
  final bool isDark;
  final String selectedLang;
  final bool isAuth;
  const AppConfigState({
    this.isDark = false,
    this.selectedLang = '',
    this.isAuth = false,
  });

  ThemeMode get theme => isDark ? ThemeMode.dark : ThemeMode.light;

  AppConfigState copyWith({
    bool? isDark,
    String? selectedLang,
    bool? isAuth,
  }) {
    return AppConfigState(
      isDark: isDark ?? this.isDark,
      selectedLang: selectedLang ?? this.selectedLang,
      isAuth: isAuth ?? this.isAuth,
    );
  }

  @override
  String toString() =>
      'AppConfigState(isDark: $isDark, selectedLang: $selectedLang, isAuth: $isAuth)';
}
