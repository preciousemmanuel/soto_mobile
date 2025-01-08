import 'dart:io';

import 'package:dio/dio.dart';
import 'package:soto_ecommerce/common/common.dart';

const String pickDisputeImageState = "pickDisputeImageState";

class DisputeVm extends BaseVM {
  final ImageHelperPicker _imagePicker = ImageHelperPicker();

  final List<File> _disputeImages = [];
  List<File> get disputeImages => _disputeImages;

  Future<ApiResponse> raiseDispute({
    String? title,
    String? description,
  }) async {
    final body = {
      "title": title,
      "description": description,
      "images": _disputeImages
          .map((e) => MultipartFile.fromFileSync(e.path))
          .toList(),
    };
    body.removeWhere(
        (k, v) => v == null || v == '' || (v is List && v.isEmpty));
    return await performApiCall(
      url: "/dispute/create",
      method: apiService.postWithAuth,
      isFormData: true,
      body: body,
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  /// removes the image at the given index from the list of dispute images
  void removeDisputeImage(int index) {
    _disputeImages.removeAt(index);
    notifyListeners();
  }

  /// clears all the dispute images
  void clearDisputeImages() {
    _disputeImages.clear();
    notifyListeners();
  }

  Future<ApiResponse> pickImage() async {
    try {
      setBusyForObject(pickDisputeImageState, true);
      // final XFile? image = await _picker.pickImage(source: source);
      final images = await _imagePicker.pickImage(multiImage: true);

      if (images.isNotEmpty) {
        //  check for sizes
        bool sizeExceeded = false;
        for (final image in images) {
          final file = File(image.path);
          int fileSizeInBytes = file.lengthSync();
          double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
          if (fileSizeInMB > 4.0) {
            sizeExceeded = true;
            break;
          }
        }

        if (sizeExceeded) {
          setBusyForObject(pickDisputeImageState, false);
          return ApiResponse(
              success: false,
              message: "One or more images exceed the size limit of 4MB");
        }

        for (final image in images) {
          final file = File(image.path);
          _disputeImages.add(file);
        }

        setBusyForObject(pickDisputeImageState, false);
        return ApiResponse(success: true);
      }

      setBusyForObject(pickDisputeImageState, false);
      return ApiResponse(success: false, message: "No image selected");
    } catch (e) {
      setBusyForObject(pickDisputeImageState, false);
      printty("Error while getting image $e");
      return ApiResponse(success: false, message: e.toString());
    }
  }
}
