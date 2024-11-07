import 'dart:convert';

import 'package:soto_ecommerce/common/models/auth_user.dart';

VendorInventory vendorInventoryFromJson(String str) =>
    VendorInventory.fromJson(json.decode(str));

String vendorInventoryToJson(VendorInventory data) =>
    json.encode(data.toJson());

class VendorInventory {
  final int? totalProducts;
  final int? totalSold;
  final int? totalInStock;
  final InventoryRecords? inventoryRecords;

  VendorInventory({
    this.totalProducts,
    this.totalSold,
    this.totalInStock,
    this.inventoryRecords,
  });

  factory VendorInventory.fromJson(Map<String, dynamic> json) =>
      VendorInventory(
        totalProducts: json["total_products"],
        totalSold: json["total_sold"],
        totalInStock: json["total_in_stock"],
        inventoryRecords: json["inventory_records"] == null
            ? null
            : InventoryRecords.fromJson(json["inventory_records"]),
      );

  Map<String, dynamic> toJson() => {
        "total_products": totalProducts,
        "total_sold": totalSold,
        "total_in_stock": totalInStock,
        "inventory_records": inventoryRecords?.toJson(),
      };
}

class InventoryRecords {
  final List<Datum>? data;
  final Pagination? pagination;

  InventoryRecords({
    this.data,
    this.pagination,
  });

  factory InventoryRecords.fromJson(Map<String, dynamic> json) =>
      InventoryRecords(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
      };
}

class Datum {
  final String? id;
  final String? productId;
  final String? productName;
  final int? quantity;
  final int? unitPrice;
  final String? vendor;
  final Buyer? buyer;
  final String? order;
  final bool? isDiscounted;
  final String? status;
  final bool? isRemitted;
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.productId,
    this.productName,
    this.quantity,
    this.unitPrice,
    this.vendor,
    this.buyer,
    this.order,
    this.isDiscounted,
    this.status,
    this.isRemitted,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        productId: json["product_id"],
        productName: json["product_name"],
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        vendor: json["vendor"],
        buyer: json["buyer"] == null ? null : Buyer.fromJson(json["buyer"]),
        order: json["order"],
        isDiscounted: json["is_discounted"],
        status: json["status"],
        isRemitted: json["is_remitted"],
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
        "product_id": productId,
        "product_name": productName,
        "quantity": quantity,
        "unit_price": unitPrice,
        "vendor": vendor,
        "buyer": buyer?.toJson(),
        "order": order,
        "is_discounted": isDiscounted,
        "status": status,
        "is_remitted": isRemitted,
        "__v": v,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Buyer {
  final ShippingAddress? shippingAddress;
  final String? id;
  final String? firstName;
  final String? lastName;

  Buyer({
    this.shippingAddress,
    this.id,
    this.firstName,
    this.lastName,
  });

  factory Buyer.fromJson(Map<String, dynamic> json) => Buyer(
        shippingAddress: json["ShippingAddress"] == null
            ? null
            : ShippingAddress.fromJson(json["ShippingAddress"]),
        id: json["_id"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
      );

  Map<String, dynamic> toJson() => {
        "ShippingAddress": shippingAddress?.toJson(),
        "_id": id,
        "FirstName": firstName,
        "LastName": lastName,
      };
}

class Pagination {
  final int? pageSize;
  final int? totalCount;
  final int? pageCount;
  final int? currentPage;
  final bool? hasNext;

  Pagination({
    this.pageSize,
    this.totalCount,
    this.pageCount,
    this.currentPage,
    this.hasNext,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        pageSize: json["pageSize"],
        totalCount: json["totalCount"],
        pageCount: json["pageCount"],
        currentPage: json["currentPage"],
        hasNext: json["hasNext"],
      );

  Map<String, dynamic> toJson() => {
        "pageSize": pageSize,
        "totalCount": totalCount,
        "pageCount": pageCount,
        "currentPage": currentPage,
        "hasNext": hasNext,
      };
}
