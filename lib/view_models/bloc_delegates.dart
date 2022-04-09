/* ************************************************************************
* Directory Name: view_models                                             *
* File Name: bloc_delegates.dart                                          *
* Created At: Saturday, 9th April 2022 9:28:06 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase/helpers/index.dart';

/// Custom [BlocObserver] which observes all bloc and cubit instances.
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    printLog('Bloc Event==> $event');
  }
/* 
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    printLog('Change==> $change');
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    printLog('Create==> $bloc');
  } */

/*   @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    printLog('Bloc Transition==>$transition');
  }
 */
  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    printError('Bloc Error==> $error');
    super.onError(bloc, error, stackTrace);
  }
}
