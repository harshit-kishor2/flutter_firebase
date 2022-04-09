/* ************************************************************************
* Directory Name: widgets                                                 *
* File Name: network_image.dart                                           *
* Created At: Saturday, 9th April 2022 10:35:52 am                        *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
/* ************************************************************************
* Directory Name: custom                                                  *
* File Name: network_image.dart                                           *
* Created At: Wednesday, 23rd March 2022 11:51:21 am                      *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatefulWidget {
  final String image;
  final double width;
  final double height;
  final Widget onError;

  const CustomNetworkImage({
    Key? key,
    required this.image,
    this.width = 50,
    this.height = 50,
    required this.onError,
  }) : super(key: key);

  @override
  State<CustomNetworkImage> createState() => _CustomNetworkImageState();
}

class _CustomNetworkImageState extends State<CustomNetworkImage> {
  bool completer = false;
  Widget mainWidget = const CircularProgressIndicator(); // Placeholder widget

  @override
  void initState() {
    super.initState();

    if (widget.image.isEmpty) {
      setState(() {
        mainWidget = widget.onError; // Error Widget
      });
    } else {
      Image image = Image.network(
        widget.image,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.fill,
      );

      final ImageStream stream = image.image.resolve(ImageConfiguration.empty);

      stream.addListener(ImageStreamListener((info, call) {
        if (!completer) {
          completer = true;
          setState(() {
            mainWidget = image;
          });
        }
      }, onError: (dynamic exception, StackTrace? stackTrace) {
        setState(() {
          mainWidget = widget.onError; // Error Widget
        });
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return mainWidget;
  }
}
