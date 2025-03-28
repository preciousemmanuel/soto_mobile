import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:soto_ecommerce/common/common.dart';

class WalletVm extends BaseVM {
  List<Bank> _allBankList = [];
  List<Bank> get allBankList => _allBankList;
  List<MyBankDetails> _myBankDetails = [];
  List<MyBankDetails> get myBankDetails => _myBankDetails;
  Map<String, List<WithdrawRequest>> _withdrawRequestsList = {};
  Map<String, List<WithdrawRequest>> get withdrawRequestsList =>
      _withdrawRequestsList;

  Future<ApiResponse> addMyBankDetails({
    required String bankId,
    required String accountNumber,
  }) async {
    return await performApiCall(
      url: "/business/add-my-bank-details",
      method: apiService.postWithAuth,
      body: {"bank_id": bankId, "account_number": accountNumber},
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> getMyBankDetails() async {
    return await performApiCall(
      url: "/business/get-my-bank-details",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _myBankDetails = myBankDetailsFromJson(json.encode(data['data']));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> fetchAllBanks() async {
    return await performApiCall(
      url: "/business/fetch-banks?limit=200&page=1",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        _allBankList = bankFromJson(json.encode(data['data']['data']));
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> makeWithdrawal({
    required String bankId,
    required double amount,
  }) async {
    final payload = {
      "bank_details_id": bankId,
      "amount": amount,
    };
    printty('payload: $payload');
    return await performApiCall(
      url: "/business/make-withdrawal-request",
      method: apiService.postWithAuth,
      body: payload,
      onSuccess: (data) {
        return apiResponse;
      },
    );
  }

  Future<ApiResponse> getWithdrawalRequests() async {
    return await performApiCall(
      url: "/business/fetch-withdrawal-requests?limit=100&page=1",
      method: apiService.getWithAuth,
      onSuccess: (data) {
        final res = withdrawRequestFromJson(json.encode(data['data']['data']));
        _withdrawRequestsList = groupBy(
          res,
          (WithdrawRequest request) => DateFormat('dd MMM yyyy').format(
            request.createdAt ?? DateTime.now(),
          ),
        );
        return apiResponse;
      },
    );
  }
}
