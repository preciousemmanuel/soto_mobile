import 'dart:convert';

SalesAnalytics salesAnalyticsFromJson(String str) =>
    SalesAnalytics.fromJson(json.decode(str));

String salesAnalyticsToJson(SalesAnalytics data) => json.encode(data.toJson());

class SalesAnalytics {
  final BestSeller? revenue;
  final BestSeller? sales;
  final BestSeller? bestSeller;

  SalesAnalytics({
    this.revenue,
    this.sales,
    this.bestSeller,
  });

  factory SalesAnalytics.fromJson(Map<String, dynamic> json) => SalesAnalytics(
        revenue: json["revenue"] == null
            ? null
            : BestSeller.fromJson(json["revenue"]),
        sales:
            json["sales"] == null ? null : BestSeller.fromJson(json["sales"]),
        bestSeller: json["best_seller"] == null
            ? null
            : BestSeller.fromJson(json["best_seller"]),
      );

  Map<String, dynamic> toJson() => {
        "revenue": revenue?.toJson(),
        "sales": sales?.toJson(),
        "best_seller": bestSeller?.toJson(),
      };
}

class BestSeller {
  final int? total;
  final int? percentage;

  BestSeller({
    this.total,
    this.percentage,
  });

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
        total: json["total"],
        percentage: json["percentage"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "percentage": percentage,
      };
}
