import 'dart:convert';

List<MyBankDetails> myBankDetailsFromJson(String str) =>
    List<MyBankDetails>.from(
        json.decode(str).map((x) => MyBankDetails.fromJson(x)));

String myBankDetailsToJson(List<MyBankDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<Bank> bankFromJson(String str) =>
    List<Bank>.from(json.decode(str).map((x) => Bank.fromJson(x)));

class MyBankDetails {
  final String? id;
  final String? accountNumber;
  final String? accountName;
  final String? user;
  final Bank? bank;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  MyBankDetails({
    this.id,
    this.accountNumber,
    this.accountName,
    this.user,
    this.bank,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MyBankDetails.fromJson(Map<String, dynamic> json) => MyBankDetails(
        id: json["_id"],
        accountNumber: json["account_number"],
        accountName: json["account_name"],
        user: json["user"],
        bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
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
        "account_number": accountNumber,
        "account_name": accountName,
        "user": user,
        "bank": bank?.toJson(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Bank {
  final String? id;
  final String? name;
  final String? slug;
  final String? code;
  final String? longcode;
  final String? country;
  final String? currency;
  final String? type;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Bank({
    this.id,
    this.name,
    this.slug,
    this.code,
    this.longcode,
    this.country,
    this.currency,
    this.type,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        code: json["code"],
        longcode: json["longcode"],
        country: json["country"],
        currency: json["currency"],
        type: json["type"],
        v: json["__v"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "slug": slug,
        "code": code,
        "longcode": longcode,
        "country": country,
        "currency": currency,
        "type": type,
        "__v": v,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
