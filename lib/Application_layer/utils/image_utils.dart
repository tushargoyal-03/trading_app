import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageUtils {
  // Declare Image picker variable
  static final ImagePicker picker = ImagePicker();

  // Image Pick Option
  static Future<File?> pickImage(int index) async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (image == null) return null;
    return File(image.path);
  }


  // Image Pick Option from Gallery
  static Future<File?> pickGallery(int index) async{
    final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
    );

    if(image == null) return null;
    return File(image.path);
  }

}