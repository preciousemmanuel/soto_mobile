import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:soto_ecommerce/common/common.dart';

const String pickImageState = "pickImageState";

class VendorProductVM extends BaseVM {
  final ImageHelperPicker _imagePicker = ImageHelperPicker();

  ProductCategory? _selectedCategory;
  ProductCategory? get selectedCategory => _selectedCategory;
  final List<File> _productImages = [];
  List<File> get productImages => _productImages;

  List<Product> _productsByVendor = [];
  List<Product> get productsByVendor => _productsByVendor;

  void setSelectCategory(ProductCategory category) {
    _selectedCategory = category;
    reBuildUI();
  }

  void removeImage(int index) {
    _productImages.removeAt(index);
    reBuildUI();
  }

  Future<ApiResponse> addNewproduct({
    bool isInstock = false,
    required String productNameC,
    String? productDescC,
    String? unitpriceC,
    String? productQtyC,
    String? disCountPriceC,
    String? heightC,
    String? widthC,
    String? weightC,
    String? productId,
    bool isEditing = false,
    List? existingImages,
  }) async {
    final body = {
      "product_name": productNameC,
      "description": productDescC,
      "category": _selectedCategory!.id,
      "unit_price": unitpriceC,
      "product_quantity": productQtyC,
      "discount_price": disCountPriceC,
      "in_stock": isInstock ? 'YES' : 'NO',
      "height": heightC,
      "width": widthC,
      "weight": weightC,
      "images": _productImages
          .map((e) => MultipartFile.fromFileSync(e.path))
          .toList(),
      for (var i = 0; i < (existingImages?.length ?? 0); i++)
        'existing_images[$i]': existingImages?[i],
    };

    // loop through body and  remove empty values
    body.removeWhere(
        (k, v) => v == null || v == '' || (v is List && v.isEmpty));
    final String url =
        isEditing ? '/product/update/$productId' : '/product/add-new';
    printty('addNewproduct body: $body, url: $url');
    return await performApiCall(
      url: url,
      method: isEditing ? apiService.putWithAuth : apiService.postWithAuth,
      isFormData: true,
      body: body,
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> getProductsByVendor() async {
    return await performApiCall(
      url: "/product/vendor-fetch?limit=10&page=1",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _productsByVendor = productFromJson(json.encode(data['data']['data']));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> fetchSingleProduct({required String productId}) async {
    return await performApiCall(
      url: "/product/view-one/$productId",
      method: apiService.get,
      onSuccess: (data) {
        // _singleProduct = Product.fromJson(data["data"]["product"]);
        return ApiResponse(
            success: true, data: ProductData.fromJson(data["data"]));
      },
    );
  }

  Future<ApiResponse> pickImage() async {
    try {
      setBusyForObject(pickImageState, true);
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
          setBusyForObject(pickImageState, false);
          return ApiResponse(
              success: false,
              message: "One or more images exceed the size limit of 4MB");
        }

        for (final image in images) {
          final file = File(image.path);
          _productImages.add(file);
        }

        setBusyForObject(pickImageState, false);
        return ApiResponse(success: true);
      }

      setBusyForObject(pickImageState, false);
      return ApiResponse(success: false, message: "No image selected");
    } catch (e) {
      setBusyForObject(pickImageState, false);
      printty("Error while getting image $e");
      return ApiResponse(success: false, message: e.toString());
    }
  }

  clearData() {
    _selectedCategory = null;
    _productImages.clear();
  }
}
