/* ************************************************************************
* Directory Name: custom                                                  *
* File Name: custom_loading_widget.dart                                   *
* Created At: Saturday, 9th April 2022 10:59:24 am                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';
import 'package:flutter_firebase/views/index.dart';

class LoadingWidget extends StatefulWidget {
  final bool backgroundTransparent;
  final bool isLoading;
  final Widget child;
  const LoadingWidget({
    Key? key,
    this.backgroundTransparent = true,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  Stream<bool> checkStream() async* {
    bool state = widget.isLoading;
    if (state) {
      yield (true);
    } else {
      yield false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: checkStream(),
      initialData: false,
      builder: (context, snapshot) {
        return Stack(
          children: <Widget>[
            widget.child,
            Loader.fullScreenLoader(
              context,
              loading: snapshot.data,
              backgroundColor:
                  widget.backgroundTransparent ? Colors.black54 : Colors.white,
              loaderImage: Loader.loading(context),
            )
          ],
        );
      },
    );
  }
}
