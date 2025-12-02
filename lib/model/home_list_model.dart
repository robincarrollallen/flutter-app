import 'dart:convert';

List<HomeListModel> homeListModelFromJson(String str) => List<HomeListModel>.from(json.decode(str).map((x) => HomeListModel.fromJson(x)));

String homeListModelToJson(List<HomeListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomeListModel {
  String gameType;
  int gameTypeSort;
  Status gameTypeStatus;
  List<PlatformList> platformList;

  HomeListModel({
    required this.gameType,
    required this.gameTypeSort,
    required this.gameTypeStatus,
    required this.platformList,
  });

  factory HomeListModel.fromJson(Map<String, dynamic> json) => HomeListModel(
    gameType: json["gameType"],
    gameTypeSort: json["gameTypeSort"],
    gameTypeStatus: statusValues.map[json["gameTypeStatus"]]!,
    platformList: List<PlatformList>.from(json["platformList"].map((x) => PlatformList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "gameType": gameType,
    "gameTypeSort": gameTypeSort,
    "gameTypeStatus": statusValues.reverse[gameTypeStatus],
    "platformList": List<dynamic>.from(platformList.map((x) => x.toJson())),
  };
}

enum Status {
  ON
}

final statusValues = EnumValues({
  "ON": Status.ON
});

class PlatformList {
  int id;
  int hot;
  String code;
  String logo;
  String name;
  int sort;
  Status status;
  Target target;
  int hotSort;
  int openType;
  int? gameCount;
  String background;
  int restriction;
  String secondaryBackground;

  PlatformList({
    required this.id,
    required this.hot,
    required this.code,
    required this.logo,
    required this.name,
    required this.sort,
    required this.status,
    required this.target,
    required this.hotSort,
    required this.openType,
    required this.gameCount,
    required this.background,
    required this.restriction,
    required this.secondaryBackground,
  });

  factory PlatformList.fromJson(Map<String, dynamic> json) => PlatformList(
    id: json["id"],
    hot: json["hot"],
    code: json["code"],
    logo: json["logo"],
    name: json["name"],
    sort: json["sort"],
    status: statusValues.map[json["status"]]!,
    target: targetValues.map[json["target"]]!,
    hotSort: json["hotSort"],
    openType: json["openType"],
    gameCount: json["gameCount"],
    background: json["background"],
    restriction: json["restriction"],
    secondaryBackground: json["secondaryBackground"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hot": hot,
    "code": code,
    "logo": logo,
    "name": name,
    "sort": sort,
    "status": statusValues.reverse[status],
    "target": targetValues.reverse[target],
    "hotSort": hotSort,
    "openType": openType,
    "gameCount": gameCount,
    "background": background,
    "restriction": restriction,
    "secondaryBackground": secondaryBackground,
  };
}

enum Target {
  GAME_LIST,
  HALL
}

final targetValues = EnumValues({
  "gameList": Target.GAME_LIST,
  "hall": Target.HALL
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
