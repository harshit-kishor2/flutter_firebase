/* ************************************************************************
* Directory Name: common                                                  *
* File Name: loader.dart                                                  *
* Created At: Saturday, 9th April 2022 10:53:46 am                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/helpers/index.dart';
import 'package:flutter_firebase/views/index.dart';

class Loader {
  /* ----> Start Loader ----> */
  //! Full Screen Loader
  static fullScreenLoader(
    BuildContext context, {
    required bool? loading,
    Color backgroundColor = Colors.white,
    required Widget loaderImage,
  }) {
    return loading == true
        ? Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                width: ScreenUtils.width(context),
                height: ScreenUtils.height(context),
                color: backgroundColor,
              ),
              Center(child: loaderImage)
            ],
          )
        : Container();
  }

  //! Activity Laoder
  static Widget loading(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(ConstColors.danger),
      ),
    );
  }

  /* End Loader class */

}
