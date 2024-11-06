import 'dart:convert';
import 'dart:io';

import 'package:soto_ecommerce/common/common.dart';

class CreateBusinessVM extends BaseVM {
  static const String businessSignupState = "businessSignupState";
  static const String selectingImageState = "businessSignupState";

  final ImageHelperPicker _imagePicker = ImageHelperPicker();

  TextEditingController businessEmailC = TextEditingController();
  TextEditingController businessPhoneC = TextEditingController();
  TextEditingController businessPasswordC = TextEditingController();
  TextEditingController businessPasswordConfirmC = TextEditingController();
  TextEditingController businessNameC = TextEditingController();
  TextEditingController businessAddressC = TextEditingController();
  TextEditingController businessCategoryC = TextEditingController();
  TextEditingController businessDescriptionC = TextEditingController();

  List<BusinessCategory> _businessCategories = [];
  List<BusinessCategory> get businessCategories => _businessCategories;

  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  bool _isValidEmail = false;
  bool get isValidEmail => _isValidEmail;

  bool get btnIsValid {
    return _isValidEmail &&
        businessPhoneC.text.length > 10 &&
        businessNameC.text.isNotEmpty &&
        businessAddressC.text.isNotEmpty &&
        businessCategoryC.text.isNotEmpty &&
        businessDescriptionC.text.isNotEmpty;
  }

  void emailIsValid() {
    _isValidEmail = businessEmailC.text.isNotEmpty &&
        businessEmailC.text.contains("@") &&
        businessEmailC.text.contains(".") &&
        businessEmailC.text.split('.').last.isNotEmpty;
    reBuildUI();
  }

  bool get passwordIsBtnValid {
    return businessPasswordC.text.isNotEmpty &&
        businessPasswordC.text == businessPasswordConfirmC.text;
  }

  Future<ApiResponse> createBusinessAccount() async {
    var body = {
      "business_name": businessNameC.text.trim(),
      "email": businessEmailC.text.trim(),
      "adress": businessAddressC.text.trim(),
      "phone_number": businessPhoneC.text.trim(),
      "category": businessCategoryC.text.trim(),
      "description": businessDescriptionC.text.trim(),
      // "business_logo": signupChannel,
      "password": businessPasswordC.text.trim()
    };

    printty(body, logName: "Sign call");
    return await performApiCall(
      url: "/business/create",
      method: apiService.post,
      busyObjectName: businessSignupState,
      body: body,
      onSuccess: (data) {
        // String token = data["data"]["token"];
        // StorageService.storeAccessToken(token);
        return ApiResponse(
          success: true,
          data: apiResponse.data,
          message: apiResponse.message,
        );
      },
    );
  }

  Future<ApiResponse> getCategories() async {
    return await performApiCall(
      url: "/category/fetch?limit=10&page=1",
      method: apiService.get,
      onSuccess: (data) {
        _businessCategories =
            businessCategoryFromJson(json.encode(data['data']['data']));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> pickImage() async {
    try {
      setBusyForObject(selectingImageState, true);
      // final XFile? image = await _picker.pickImage(source: source);
      final images = await _imagePicker.pickImage();

      if (images.isNotEmpty) {
        final croppedFile = await _imagePicker.crop(
          file: images.first,
        );
        printty("croppedFile $croppedFile");

        if (croppedFile != null) {
          File cropImage = File(croppedFile.path);
          int fileSizeInBytes = cropImage.lengthSync();
          printty("cropImage size ${cropImage.lengthSync()}");
          double fileSizeInMB =
              fileSizeInBytes / (1024 * 1024); // Convert bytes to megabytes
          printty("fileSizeInBytes size $fileSizeInMB");

          // check if file size is greater than 4mb
          if (fileSizeInMB > 4.0) {
            setBusyForObject(selectingImageState, false);
            return ApiResponse(
                success: false,
                message: "Image size should not be greater than 4mb");
          }

          _selectedImage = cropImage;
        }

        setBusyForObject(selectingImageState, false);
        return ApiResponse(success: true);
      }

      setBusyForObject(selectingImageState, false);
      return ApiResponse(success: false, message: "No image selected");
    } catch (e) {
      setBusyForObject(selectingImageState, false);
      printty("Error while getting image $e");
      return ApiResponse(success: false, message: e.toString());
    }
  }

  void clearData() {
    _selectedImage = null;
    _isValidEmail = false;

    businessEmailC.clear();
    businessPasswordC.clear();
    businessPasswordConfirmC.clear();
    businessPhoneC.clear();
    businessNameC.clear();
    businessAddressC.clear();
    businessCategoryC.clear();
    businessDescriptionC.clear();
  }

  @override
  void dispose() {
    printty('Signup VM Disposed');

    businessEmailC.dispose();
    businessPasswordC.dispose();
    businessPasswordConfirmC.dispose();
    businessPhoneC.dispose();
    businessNameC.dispose();
    businessAddressC.dispose();
    businessCategoryC.dispose();
    businessDescriptionC.dispose();
    super.dispose();
  }
}
