import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelperPicker {
  ImageHelperPicker({
    ImagePicker? imagePicker,
    ImageCropper? imageCropper,
  })  : _imagePicker = imagePicker ?? ImagePicker(),
        _imageCropper = imageCropper ?? ImageCropper();

  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  Future<List<XFile>> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
    bool multiImage = false,
  }) async {
    if (multiImage) {
      final pickedFile = await _imagePicker.pickMultiImage(
        imageQuality: imageQuality,
      );
      return pickedFile;
    }

    final pickedFile = await _imagePicker.pickImage(
      imageQuality: imageQuality,
      source: source,
    );
    if (pickedFile != null) return [pickedFile];
    return [];
  }

  Future<CroppedFile?> crop({
    required XFile file,
    CropStyle cropStyle = CropStyle.rectangle,
  }) async {
    return await _imageCropper.cropImage(
      sourcePath: file.path,
      compressQuality: 100,
      uiSettings: [
        cropStyle == CropStyle.circle
            ? IOSUiSettings(
                title: 'Crop Image',
                cancelButtonTitle: 'Cancel',
                doneButtonTitle: 'Done',
                // aspectRatioLockEnabled: true,
              )
            : IOSUiSettings(
                title: 'Crop Image',
                cancelButtonTitle: 'Cancel',
                doneButtonTitle: 'Done',
                aspectRatioLockEnabled: true,
              ),
        cropStyle == CropStyle.circle
            ? AndroidUiSettings(
                toolbarTitle: 'Crop Image',
                toolbarColor: Colors.white,
                toolbarWidgetColor: Colors.black,
                // initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false,
              )
            : AndroidUiSettings(
                toolbarTitle: 'Crop Image',
                toolbarColor: Colors.white,
                toolbarWidgetColor: Colors.black,
                lockAspectRatio: false,
              ),
      ],
    );
  }
}
