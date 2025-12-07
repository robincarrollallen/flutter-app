import 'dart:convert';

List<LobbySidebarBannerListModel> lobbySidebarBannerListModelFromJson(String str) => List<LobbySidebarBannerListModel>.from(json.decode(str).map((x) => LobbySidebarBannerListModel.fromJson(x)));

String lobbySidebarBannerListModelToJson(List<LobbySidebarBannerListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LobbySidebarBannerListModel {
  int? id;
  BannerType? bannerType;
  String? name;
  ShoName? showName;
  String? imageUrl;
  ShoName? shortName;
  IconUrlType? iconUrlType;
  String? defaultIconUrl;
  String? customIconUrl;
  TargetType? targetType;
  String? targetValue;
  bool? status;
  int? sort;
  String? remark;

  LobbySidebarBannerListModel({
    this.id,
    this.bannerType,
    this.name,
    this.showName,
    this.imageUrl,
    this.shortName,
    this.iconUrlType,
    this.defaultIconUrl,
    this.customIconUrl,
    this.targetType,
    this.targetValue,
    this.status,
    this.sort,
    this.remark,
  });

  factory LobbySidebarBannerListModel.fromJson(Map<String, dynamic> json) => LobbySidebarBannerListModel(
    id: json["id"],
    bannerType: bannerTypeValues.map[json["bannerType"]]!,
    name: json["name"],
    showName: shoNameValues.map[json["showName"]] ?? ShoName.EMPTY,
    imageUrl: json["imageUrl"],
    shortName: shoNameValues.map[json["shortName"]] ?? ShoName.EMPTY,
    iconUrlType: iconUrlTypeValues.map[json["iconUrlType"]]!,
    defaultIconUrl: json["defaultIconUrl"],
    customIconUrl: json["customIconUrl"],
    targetType: targetTypeValues.map[json["targetType"]]!,
    targetValue: json["targetValue"],
    status: json["status"],
    sort: json["sort"],
    remark: json["remark"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bannerType": bannerTypeValues.reverse[bannerType],
    "name": name,
    "showName": shoNameValues.reverse[showName],
    "imageUrl": imageUrl,
    "shortName": shoNameValues.reverse[shortName],
    "iconUrlType": iconUrlTypeValues.reverse[iconUrlType],
    "defaultIconUrl": defaultIconUrl,
    "customIconUrl": customIconUrl,
    "targetType": targetTypeValues.reverse[targetType],
    "targetValue": targetValue,
    "status": status,
    "sort": sort,
    "remark": remark,
  };
}

enum BannerType {
  LOBBY_SIDEBAR_BANNER
}

final bannerTypeValues = EnumValues({
  "lobby_sidebar_banner": BannerType.LOBBY_SIDEBAR_BANNER
});

enum IconUrlType {
  CUSTOM,
  DEFAULT
}

final iconUrlTypeValues = EnumValues({
  "custom": IconUrlType.CUSTOM,
  "default": IconUrlType.DEFAULT
});

enum ShoName {
  EMPTY,
  PURPLE,
  SHO_NAME
}

final shoNameValues = EnumValues({
  "": ShoName.EMPTY,
  "新人专享": ShoName.PURPLE,
  "自定义简称": ShoName.SHO_NAME
});

enum TargetType {
  EXTERNAL,
  INTERNAL
}

final targetTypeValues = EnumValues({
  "external": TargetType.EXTERNAL,
  "internal": TargetType.INTERNAL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
