/* ************************************************************************
* Directory Name: lib                                                     *
* File Name: injection_container.dart                                     *
* Created At: Saturday, 9th April 2022 7:55:49 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:dio/dio.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/services/index.dart';
import 'package:get_it/get_it.dart';

import 'view_models/index.dart';

final di = GetIt.instance;

Future<void> init() async {
  //start

/* ==================================== Features ====================================== */

  //! blocs
  di.registerFactory(
    () => LoginBloc(loginRepo: di()),
  );

  //! Services
  di.registerLazySingleton<LoginRepo>(() => LoginImpl(dio: di()));

/* =================================== External ======================================= */

//DioClient
  di.registerLazySingleton<Dio>(() => DioClient().provideDio());
  di.registerLazySingleton<MediaService>(() => MediaServiceImpl());

  //End
}
