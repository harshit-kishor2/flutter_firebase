/* ************************************************************************
* Directory Name: implemetations                                          *
* File Name: login_impl.dart                                              *
* Created At: Saturday, 9th April 2022 9:14:23 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/services/index.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthImpl implements AuthRepo {
  /* Start Login Impl */
  //final FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  //Login service
  @override
  Future<String> postLogin(Map<String, dynamic> req) async {
    try {
      // Response response = await dio.post(ConstApis.loginApi, data: req);
      UserCredential res = await auth.signInWithEmailAndPassword(
          email: req["email"], password: req["password"]);
      SharedPref.setBool(key: SharedPref.prefAuth, data: true);
      return "Suceess";
    } on Exception catch (e) {
      throw BaseException(code: 500, message: e.toString());
    } catch (e) {
      throw BaseException(code: 500, message: e.toString());
    }
  }

  @override
  Future<String> postForgotPass(Map<String, dynamic> req) async {
    try {
      await auth.sendPasswordResetEmail(email: req["email"]);
      SharedPref.setBool(key: SharedPref.prefAuth, data: false);
      return "Success";
    } on Exception catch (e) {
      throw BaseException(code: 500, message: e.toString());
    } catch (e) {
      throw BaseException(code: 500, message: e.toString());
    }
  }

  @override
  Future<String> postRegister(Map<String, dynamic> req) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: req["email"], password: req["password"]);

      return "Suceess";
    } on Exception catch (e) {
      throw BaseException(code: 500, message: e.toString());
    } catch (e) {
      throw BaseException(code: 500, message: e.toString());
    }
  }

  @override
  Future<bool> logoutService() async {
    try {
      await auth.signOut();
      SharedPref.setBool(key: SharedPref.prefAuth, data: false);
      return true;
    } on Exception catch (e) {
      throw BaseException(code: 500, message: e.toString());
    } catch (e) {
      throw BaseException(code: 500, message: e.toString());
    }
  }
  /* End Login Impl */
}
