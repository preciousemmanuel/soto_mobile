import 'dart:async';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:soto_ecommerce/common/common.dart';
import 'package:soto_ecommerce/env/env_init.dart';

class DioApiService {
  int timeOutDurationInSeconds = 30;
  int connectionTimeout = 6000;
  AppInterceptors appInterceptors;
  late Dio dio;

  var options = BaseOptions(
    baseUrl: EnvMain().config.baseUrl,
    connectTimeout: const Duration(seconds: 6000),
    receiveTimeout: const Duration(seconds: 3000),
  );

  final prettyLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 10090,
  );
  DioApiService({required this.appInterceptors}) {
    dio = Dio(options);
    dio.interceptors.add(appInterceptors);
    dio.interceptors.add(prettyLogger);
    Map<String, dynamic> headers = {'Accept': 'application/json'};
    dio.options.headers = headers;
  }

  Future<ApiResponse> post({
    var body,
    required String url,
    bool isFormData = false,
  }) async {
    try {
      printty(options.baseUrl, logName: "custom options");
      printty(url);
      printty(options.headers.toString(), logName: 'custom headers');
      printty("headers===>");

      final dio = Dio(options);
      dio.interceptors.add(prettyLogger);
      Response response = await dio
          .post(
            url,
            data: isFormData ? FormData.fromMap(body) : body,
          )
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e) {
      printty("error");
      return DioResponseHandler.dioErrorHandler(e);
    }
  }

  Future<ApiResponse> get(
      {var body, required String url, bool isFormData = false}) async {
    try {
      final dio = Dio(options);
      dio.interceptors.add(prettyLogger);
      Response response = await dio
          .get(url)
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e, s) {
      printty('${e.toString()} $s', logName: "get error");
      return DioResponseHandler.dioErrorHandler(e);
    }
  }

  Future<ApiResponse> putWithAuth(
      {dynamic body, required String url, bool isFormData = false}) async {
    try {
      Response response = await dio
          .put(url, data: body)
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e, s) {
      printty('${e.toString()} $s', logName: "get error");
      return DioResponseHandler.dioErrorHandler(e);
    }
  }

  Future<ApiResponse> postWithAuth({
    var body,
    required String url,
    bool canRetry = true,
    bool isFormData = false,
    String? contentType,
  }) async {
    try {
      // await HeaderService().getDeviceInfo();
      // dio.options.headers.addAll(await getDeviceHeaders());

      if (contentType != null) {
        dio.options.contentType = contentType;
      }

      dynamic data = body;
      if (body != null && isFormData) {
        data = FormData.fromMap(body);
      }
      printty(dio.options.baseUrl);
      printty(url, logName: "url full path");
      Response response = await dio
          .post(url, data: data)
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e, s) {
      printty('${e.toString()} $s', logName: "postWithAuth error");

      return DioResponseHandler.dioErrorHandler(e);
    } catch (e) {
      printty("flsjfklskf: $e");
      return ApiResponse(success: false);
    }
  }

  Future<ApiResponse> postWithAuthWithoutFormData({
    var body,
    required String url,
    bool canRetry = true,
    String? contentType,
    bool formData = true,
  }) async {
    try {
      // await HeaderService().getDeviceInfo();
      // dio.options.headers.addAll(await getDeviceHeaders());

      if (contentType != null) {
        dio.options.contentType = contentType;
      }

      dynamic data = body;
      // if (body != null && formData) {
      //   data = FormData.fromMap(body);
      // }
      printty(dio.options.baseUrl);
      Response response = await dio
          .post(url, data: contentType == null ? data : body)
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e, s) {
      printty(e.toString());
      printty(s.toString());
      return DioResponseHandler.dioErrorHandler(e);
    } catch (e) {
      printty("flsjfklskf: $e");
      return ApiResponse(success: false);
    }
  }

  Future<ApiResponse> deleteWithAuth({
    var body,
    required String url,
    bool canRetry = true,
    String? contentType,
    bool isFormData = false,
  }) async {
    try {
      // await HeaderService().getDeviceInfo();
      // dio.options.headers.addAll(await getDeviceHeaders());

      if (contentType != null) {
        dio.options.contentType = contentType;
      }

      dynamic data = body;
      if (body != null) {
        data = FormData.fromMap(body);
      }

      Response response = await dio
          .delete(url, data: contentType == null ? data : body)
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e, s) {
      printty(e.toString());
      printty(s.toString());
      return DioResponseHandler.dioErrorHandler(e);
    } catch (e) {
      printty("flsjfklskf: $e");
      return ApiResponse(success: false);
    }
  }

  Future<ApiResponse> getWithAuth({
    var body,
    required String url,
    bool canRetry = true,
    bool isFormData = false,
  }) async {
    try {
      // await HeaderService().getDeviceInfo();
      // dio.options.headers.addAll(await getDeviceHeaders());
      printty(dio.options.baseUrl);
      Response response = await dio
          .get(url)
          .timeout(Duration(seconds: timeOutDurationInSeconds));
      return DioResponseHandler.parseResponse(response);
    } on DioException catch (e) {
      return DioResponseHandler.dioErrorHandler(e);
    }
  }

  Future<ApiResponse> printtyout() async {
    await StorageService.logout();
    return ApiResponse(
        code: 401, success: false, message: "Unauthorized. Access denied!!!");
  }
}

DioApiService apiService = DioApiService(appInterceptors: AppInterceptors());
