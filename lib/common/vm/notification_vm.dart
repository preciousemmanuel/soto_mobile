import 'dart:convert';

import 'package:soto_ecommerce/common/common.dart';

const submitNotyState = 'submitNotyState';

class NotificationVm extends BaseVM {
  List<NotificationModel> _notificationList = [];
  List<NotificationModel> get notificationList => _notificationList;

  Future<ApiResponse> fetchNotifications() async {
    return await performApiCall(
      url: "/notification/fetch?limit=10&page=1",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _notificationList =
            notificationModelFromJson(jsonEncode(data["data"]["data"]));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> readNotification(String id) async {
    return await performApiCall(
      url: "/notification/mark-as-read/$id",
      method: apiService.putWithAuth,
      onSuccess: (data) {
        fetchNotifications();
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> sendFcmToken(String token, String userId) async {
    return await performApiCall(
      url: "/notification/fetch?limit=10&page=1",
      method: apiService.postWithAuth,
      body: {
        "fcmToken": token, // for firebase push notification
        // "playerId":"23465ydrgfsa", // for one signal push notification
        "user_id": userId,
      },
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }
}
