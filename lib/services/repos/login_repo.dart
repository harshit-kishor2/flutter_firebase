/* ************************************************************************
* Directory Name: repos                                                   *
* File Name: login_repo.dart                                              *
* Created At: Saturday, 9th April 2022 9:14:05 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
abstract class LoginRepo {
  Future<String> postLogin(Map<String, dynamic> req);
}
