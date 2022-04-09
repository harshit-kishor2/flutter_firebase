/* ************************************************************************
* Directory Name: common                                                  *
* File Name: failure.dart                                                 *
* Created At: Saturday, 9th April 2022 8:57:50 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  /* Start of failure abstract class */

  final int? code;
  final String message;

  const Failure({
    this.code,
    required this.message,
  });

  @override
  List<Object?> get props => [message, code];
  /* End of failure abstract class */
}

//* Create a BaseFailure class for getting all Failures
class BaseFailure extends Failure {
  const BaseFailure({required String message, int? code})
      : super(message: message, code: code);
}

//* Create a BaseException class for getting all Exceptions
class BaseException extends Failure implements Exception {
  const BaseException({required String message, int? code})
      : super(message: message, code: code);
}
