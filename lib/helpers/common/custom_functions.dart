/* ************************************************************************
* Directory Name: common                                                  *
* File Name: mixin.dart                                                   *
* Created At: Sunday, 10th April 2022 4:39:18 pm                          *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
class CustomFunctions {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static bool isEmailValid(String email) {
    return _emailRegExp.hasMatch(email);
  }
}
