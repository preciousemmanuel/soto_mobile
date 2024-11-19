import 'dart:convert';

List<StateModel> stateModelFromJson(String str) =>
    List<StateModel>.from(json.decode(str).map((x) => StateModel.fromJson(x)));

String stateModelToJson(List<StateModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StateModel {
  final String? id;
  final String? name;
  final String? isoCode;
  final String? countryCode;
  final String? latitude;
  final String? longitude;

  StateModel({
    this.id,
    this.name,
    this.isoCode,
    this.countryCode,
    this.latitude,
    this.longitude,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
        id: json["_id"],
        name: json["name"],
        isoCode: json["isoCode"],
        countryCode: json["countryCode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "isoCode": isoCode,
        "countryCode": countryCode,
        "latitude": latitude,
        "longitude": longitude,
      };
}

List<CityModel> cityModelFromJson(String str) =>
    List<CityModel>.from(json.decode(str).map((x) => CityModel.fromJson(x)));

String cityModelToJson(List<CityModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityModel {
  final String? id;
  final String? name;
  final String? countryCode;
  final String? stateCode;
  final String? latitude;
  final String? longitude;

  CityModel({
    this.id,
    this.name,
    this.countryCode,
    this.stateCode,
    this.latitude,
    this.longitude,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        id: json["_id"],
        name: json["name"],
        countryCode: json["countryCode"],
        stateCode: json["stateCode"],
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "countryCode": countryCode,
        "stateCode": stateCode,
        "latitude": latitude,
        "longitude": longitude,
      };
}
