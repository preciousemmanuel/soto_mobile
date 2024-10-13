// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:korrency/core/core.dart';

// class TokenService {
//   final baseUrl = dotenv.env['BASE_URL'];
//   Future<bool> refreshToken() async {
//     String? token = await StorageService.getString(StorageKey.accessToken);
//     String? refreshToken =
//         await StorageService.getString(StorageKey.refreshToken);
//     log("old token: $token");
//     log("old refresh token: $refreshToken}");
//     log("***************");

//     try {
//       if (refreshToken == null) {
//         return false;
//       }

//       String url = "$baseUrl/oauth2/token";
//       Dio tokenDio = Dio();
//       Response response =
//           await tokenDio.post(url, data: {"refresh_token": refreshToken});

//       ApiResponse serviceResponse = DioResponseHandler.parseResponse(response);

//       if (!serviceResponse.success) {
//         return false;
//       }

//       log("new token: ${serviceResponse.data["access_token"]}");
//       log("refresh new token: ${serviceResponse.data["refresh_token"]}");

//       await StorageService.storeString(
//           StorageKey.accessToken, serviceResponse.data["access_token"]);
//       await StorageService.storeString(
//           StorageKey.refreshToken, serviceResponse.data["refresh_token"]);
//       return true;
//     } on DioException catch (e) {
//       log(e.toString());
//       return false;
//     } catch (e) {
//       return false;
//     }
//   }
// }
