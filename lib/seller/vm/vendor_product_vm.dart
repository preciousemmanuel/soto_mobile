import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:soto_ecommerce/common/common.dart';

const String pickImageState = "pickImageState";

class VendorProductVM extends BaseVM {
  final ImageHelperPicker _imagePicker = ImageHelperPicker();

  TextEditingController productNameC = TextEditingController();
  TextEditingController productDescC = TextEditingController();
  TextEditingController unitpriceC = TextEditingController();
  TextEditingController productQtyC = TextEditingController();
  TextEditingController disCountPriceC = TextEditingController();
  TextEditingController heightC = TextEditingController();
  TextEditingController widthC = TextEditingController();
  TextEditingController weightC = TextEditingController();
  ProductCategory? _selectedCategory;
  ProductCategory? get selectedCategory => _selectedCategory;
  final List<File> _productImages = [];
  List<File> get productImages => _productImages;

  List<Product> _productsByVendor = [];
  List<Product> get productsByVendor => _productsByVendor;

  bool get btnIsValid {
    return productNameC.text.isNotEmpty &&
        productDescC.text.isNotEmpty &&
        _selectedCategory != null &&
        unitpriceC.text.isNotEmpty &&
        productQtyC.text.isNotEmpty;
  }

  void selectCategory(ProductCategory category) {
    _selectedCategory = category;
    reBuildUI();
  }

  void removeImage(int index) {
    _productImages.removeAt(index);
    reBuildUI();
  }

  Future<ApiResponse> addNewproduct({bool isInstock = false}) async {
    final body = {
      "product_name": productNameC.text.trim(),
      "description": productDescC.text.trim(),
      "category": _selectedCategory!.id,
      "unit_price": unitpriceC.text.trim(),
      "product_quantity": productQtyC.text.trim(),
      "discount_price": disCountPriceC.text.trim(),
      "in_stock": isInstock ? 'YES' : 'NO',
      "height": heightC.text.trim(),
      "width": widthC.text.trim(),
      "weight": weightC.text.trim(),
      "images": _productImages
          .map((e) => MultipartFile.fromFileSync(e.path))
          .toList(),
    };

    // loop through body and  remove empty values
    body.removeWhere((key, value) => value == null || value == '');

    printty('addNewproduct body: $body');
    return await performApiCall(
      url: "/product/add-new",
      method: apiService.postWithAuth,
      isFormData: true,
      body: body,
      onSuccess: (data) {
        //
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
    productNameC.clear();
    productDescC.clear();
    unitpriceC.clear();
    productQtyC.clear();
    disCountPriceC.clear();
    heightC.clear();
    widthC.clear();
    weightC.clear();
  }

  @override
  void dispose() {
    printty('Vendor Product VM Disposed');

    productNameC.dispose();
    productDescC.dispose();
    unitpriceC.dispose();
    productQtyC.dispose();
    disCountPriceC.dispose();
    heightC.dispose();
    widthC.dispose();
    weightC.dispose();
    super.dispose();
  }
}
