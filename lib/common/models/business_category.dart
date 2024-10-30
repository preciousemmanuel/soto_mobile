import 'dart:convert';

List<BusinessCategory> businessCategoryFromJson(String str) =>
    List<BusinessCategory>.from(
        json.decode(str).map((x) => BusinessCategory.fromJson(x)));

String businessCategoryToJson(List<BusinessCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BusinessCategory {
  final String? id;
  final String? name;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  BusinessCategory({
    this.id,
    this.name,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory BusinessCategory.fromJson(Map<String, dynamic> json) =>
      BusinessCategory(
        id: json["_id"],
        name: json["name"],
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
        "__v": v,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
