/* ************************************************************************
* Directory Name: common                                                  *
* File Name: media_service.dart                                           *
* Created At: Saturday, 9th April 2022 8:50:01 am                         *
* Created By: singsys (Harshit Kishor)                                    *
************************************************************************ */

//! Service For image upload from camera and gallery
import 'package:flutter_firebase/helpers/index.dart';
import 'package:image_picker/image_picker.dart';

abstract class MediaService {
  Future<XFile?> getImage({required ImageSource source});
  Future<XFile?> getVideo({required ImageSource source});
}

class MediaServiceImpl implements MediaService {
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Future<XFile?> getImage({
    required ImageSource source,
  }) async {
    try {
      final XFile? _image = await _imagePicker.pickImage(
        source: source,
        imageQuality: 20,
      );
      printError("_image,${_image?.path}");

      return _image;
    } catch (e) {
      throw BaseException(code: 500, message: e.toString());
    }
  }

  @override
  Future<XFile?> getVideo({
    required ImageSource source,
  }) async {
    try {
      final XFile? _video = await _imagePicker.pickVideo(
        source: source,
      );
      printError("_image,${_video?.path}");
      return _video;
    } catch (e) {
      throw BaseException(code: 500, message: e.toString());
    }
  }
}
