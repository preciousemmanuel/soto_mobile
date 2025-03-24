import 'dart:convert';

List<WithdrawRequest> withdrawRequestFromJson(String str) =>
    List<WithdrawRequest>.from(
        json.decode(str).map((x) => WithdrawRequest.fromJson(x)));

String withdrawRequestToJson(List<WithdrawRequest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WithdrawRequest {
  final String? id;
  final int? amount;
  final String? user;
  final String? accountName;
  final String? accountNumber;
  final String? bankDetals;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  WithdrawRequest({
    this.id,
    this.amount,
    this.user,
    this.accountName,
    this.accountNumber,
    this.bankDetals,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory WithdrawRequest.fromJson(Map<String, dynamic> json) =>
      WithdrawRequest(
        id: json["_id"],
        amount: json["amount"],
        user: json["user"],
        accountName: json["account_name"],
        accountNumber: json["account_number"],
        bankDetals: json["bank_detals"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "amount": amount,
        "user": user,
        "account_name": accountName,
        "account_number": accountNumber,
        "bank_detals": bankDetals,
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
