import 'dart:convert';

List<BannerModel> bannerModelFromJson(String str) => List<BannerModel>.from(json.decode(str).map((x) => BannerModel.fromJson(x)));

String bannerModelToJson(List<BannerModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerModel {
  int id;
  String bannerType;
  String name;
  dynamic showName;
  String imageUrl;
  dynamic shortName;
  String iconUrlType;
  dynamic defaultIconUrl;
  dynamic customIconUrl;
  String targetType;
  String targetValue;
  bool status;
  int sort;
  String remark;

  BannerModel({
    required this.id,
    required this.bannerType,
    required this.name,
    required this.showName,
    required this.imageUrl,
    required this.shortName,
    required this.iconUrlType,
    required this.defaultIconUrl,
    required this.customIconUrl,
    required this.targetType,
    required this.targetValue,
    required this.status,
    required this.sort,
    required this.remark,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    bannerType: json["bannerType"],
    name: json["name"],
    showName: json["showName"],
    imageUrl: json["imageUrl"],
    shortName: json["shortName"],
    iconUrlType: json["iconUrlType"],
    defaultIconUrl: json["defaultIconUrl"],
    customIconUrl: json["customIconUrl"],
    targetType: json["targetType"],
    targetValue: json["targetValue"],
    status: json["status"],
    sort: json["sort"],
    remark: json["remark"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bannerType": bannerType,
    "name": name,
    "showName": showName,
    "imageUrl": imageUrl,
    "shortName": shortName,
    "iconUrlType": iconUrlType,
    "defaultIconUrl": defaultIconUrl,
    "customIconUrl": customIconUrl,
    "targetType": targetType,
    "targetValue": targetValue,
    "status": status,
    "sort": sort,
    "remark": remark,
  };
}
