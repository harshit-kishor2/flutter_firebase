/* ************************************************************************
* Directory Name: implemetations                                          *
* File Name: login_impl.dart                                              *
* Created At: Saturday, 9th April 2022 9:14:23 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:dio/dio.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/services/index.dart';

class LoginImpl implements LoginRepo {
  /* Start Login Impl */
  final Dio dio;
  LoginImpl({
    required this.dio,
  });

  //Login service
  @override
  Future<String> postLogin(Map<String, dynamic> req) async {
    try {
      Response response = await dio.post(ConstApis.loginApi, data: req);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return "Success";
      } else {
        throw BaseException(
          code: response.statusCode,
          message: "Some error occured during login.",
        );
      }
    } on DioError catch (e) {
      throw BaseException(
        code: e.response?.statusCode,
        message: "Some error occured during login.",
      );
    } on Exception catch (e) {
      throw BaseException(code: 500, message: e.toString());
    } catch (e) {
      throw BaseException(code: 500, message: e.toString());
    }
  }

  /* End Login Impl */
}
