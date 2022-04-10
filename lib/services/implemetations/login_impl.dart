/* ************************************************************************
* Directory Name: implemetations                                          *
* File Name: login_impl.dart                                              *
* Created At: Saturday, 9th April 2022 9:14:23 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/services/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const BaseException(
            code: 500, message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw const BaseException(
            code: 500, message: 'Wrong password provided for that user.');
      } else {
        throw const BaseException(
            code: 500, message: 'Some error in firebase auth excepion');
      }
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
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw const BaseException(
            code: 500, message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw const BaseException(
            code: 500, message: 'The account already exists for that email.');
      } else {
        throw const BaseException(
            code: 500, message: 'Some error in firebase auth excepion');
      }
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

  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
      SharedPref.setBool(key: SharedPref.prefAuth, data: true);
    } on Exception catch (e) {
      throw BaseException(code: 500, message: e.toString());
    } catch (e) {
      throw BaseException(code: 500, message: e.toString());
    }
  }

  @override
  Future<String> changePassword(Map<String, dynamic> req) async {
    try {
      User? currentUser = auth.currentUser;
      final cred = EmailAuthProvider.credential(
          email: currentUser?.email ?? '', password: req["password"]);

      UserCredential? relogin =
          await currentUser?.reauthenticateWithCredential(cred);
      if (relogin != null) {
        currentUser?.updatePassword(req["newPassword"]);
      }
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw const BaseException(
            code: 500, message: 'The password provided is too weak.');
      } else if (e.code == 'wrong-password') {
        throw const BaseException(
            code: 500, message: 'Wrong password provided');
      } else {
        throw const BaseException(
            code: 500, message: 'Some error in firebase auth excepion');
      }
    } on Exception catch (e) {
      throw BaseException(code: 500, message: e.toString());
    } catch (e) {
      throw BaseException(code: 500, message: e.toString());
    }
  }

  /* End Login Impl */
}
