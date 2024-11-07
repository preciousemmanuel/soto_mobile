import 'dart:convert';

List<Transaction> transactionFromJson(String str) => List<Transaction>.from(
    json.decode(str).map((x) => Transaction.fromJson(x)));

String transactionToJson(List<Transaction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Transaction {
  final String? id;
  final String? reference;
  final int? amount;
  final String? user;
  final String? type;
  final String? status;
  final String? currency;
  final String? narration;
  final String? narrationId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  Transaction({
    this.id,
    this.reference,
    this.amount,
    this.user,
    this.type,
    this.status,
    this.currency,
    this.narration,
    this.narrationId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["_id"],
        reference: json["reference"],
        amount: json["amount"],
        user: json["user"],
        type: json["type"],
        status: json["status"],
        currency: json["currency"],
        narration: json["narration"],
        narrationId: json["narration_id"],
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
        "reference": reference,
        "amount": amount,
        "user": user,
        "type": type,
        "status": status,
        "currency": currency,
        "narration": narration,
        "narration_id": narrationId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
