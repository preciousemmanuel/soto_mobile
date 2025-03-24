import 'dart:convert';

import 'package:soto_ecommerce/common/models/auth_user.dart';

VendorOverview vendorOverviewFromJson(String str) =>
    VendorOverview.fromJson(json.decode(str));

String vendorOverviewToJson(VendorOverview data) => json.encode(data.toJson());

class VendorOverview {
  final AuthUser? user;
  final int? totalUnremitted;
  final int? totalInStock;
  final Map<String, List<IncomeStatAgg>>? incomeStatAgg;

  VendorOverview({
    this.user,
    this.totalUnremitted,
    this.totalInStock,
    this.incomeStatAgg,
  });

  factory VendorOverview.fromJson(Map<String, dynamic> json) => VendorOverview(
        user: json["user"] == null ? null : AuthUser.fromJson(json["user"]),
        totalUnremitted: json["total_unremitted"],
        totalInStock: json["total_in_stock"],
        incomeStatAgg: Map.from(json["income_stat_agg"]!).map((k, v) =>
            MapEntry<String, List<IncomeStatAgg>>(
                k,
                List<IncomeStatAgg>.from(
                    v.map((x) => IncomeStatAgg.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
        "total_unremitted": totalUnremitted,
        "total_in_stock": totalInStock,
        "income_stat_agg": Map.from(incomeStatAgg!).map((k, v) =>
            MapEntry<String, dynamic>(
                k, List<dynamic>.from(v.map((x) => x.toJson())))),
      };
}

class IncomeStatAgg {
  final DateTime? start;
  final DateTime? end;
  final String? day;
  final dynamic month;
  final int? totalPriceValue;

  IncomeStatAgg({
    this.start,
    this.end,
    this.day,
    this.month,
    this.totalPriceValue,
  });

  factory IncomeStatAgg.fromJson(Map<String, dynamic> json) => IncomeStatAgg(
        start: json["start"] == null ? null : DateTime.parse(json["start"]),
        end: json["end"] == null ? null : DateTime.parse(json["end"]),
        day: json["day"],
        month: json["month"],
        totalPriceValue: json["total_price_value"],
      );

  Map<String, dynamic> toJson() => {
        "start": start?.toIso8601String(),
        "end": end?.toIso8601String(),
        "day": day,
        "month": month,
        "total_price_value": totalPriceValue,
      };
}
