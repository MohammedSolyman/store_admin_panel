import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

import 'package:flutter/foundation.dart';

class SelectedImage {
  Uint8List? fileBytes;
  String? imageBaseName = '';

  SelectedImage();

  SelectedImage.from(FilePickerResult result) {
    fileBytes = result.files.first.bytes;
    imageBaseName = result.files.first.name;
  }
}
