/* ************************************************************************
* Directory Name: repos                                                   *
* File Name: login_repo.dart                                              *
* Created At: Saturday, 9th April 2022 9:14:05 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
abstract class AuthRepo {
  Future<String> postLogin(Map<String, dynamic> req);
  Future<String> postRegister(Map<String, dynamic> req);
  Future<String> postForgotPass(Map<String, dynamic> req);
  Future<bool> logoutService();
  Future<void> signInWithGoogle();
  Future<String> changePassword(Map<String, dynamic> req);
}
