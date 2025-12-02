import 'dart:convert';

List<ActivityListModel> activityListModelFromJson(String str) => List<ActivityListModel>.from(json.decode(str).map((x) => ActivityListModel.fromJson(x)));

String activityListModelToJson(List<ActivityListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ActivityListModel {
  int? id;
  String? name;
  String? nameType;
  String? nameParams;
  String? condition;
  String? category;
  String? type;
  String? bannerBackground;
  String? bannerLogo;
  int? sort;
  DateTime? showStartTime;
  DateTime? showEndTime;
  String? ruleType;
  String? rule;
  int? tenantId;
  String? previewText;
  String? status;
  DateTime? startTime;
  DateTime? endTime;
  String? activityDetailSelect;
  int? statusIndex;
  int? top;

  ActivityListModel({
    this.id,
    this.name,
    this.nameType,
    this.nameParams,
    this.condition,
    this.category,
    this.type,
    this.bannerBackground,
    this.bannerLogo,
    this.sort,
    this.showStartTime,
    this.showEndTime,
    this.ruleType,
    this.rule,
    this.tenantId,
    this.previewText,
    this.status,
    this.startTime,
    this.endTime,
    this.activityDetailSelect,
    this.statusIndex,
    this.top,
  });

  factory ActivityListModel.fromJson(Map<String, dynamic> json) => ActivityListModel(
    id: json["id"],
    name: json["name"],
    nameType: json["nameType"],
    nameParams: json["nameParams"],
    condition: json["condition"],
    category: json["category"],
    type: json["type"],
    bannerBackground: json["bannerBackground"],
    bannerLogo: json["bannerLogo"],
    sort: json["sort"],
    showStartTime: json["showStartTime"] == null ? null : DateTime.parse(json["showStartTime"]),
    showEndTime: json["showEndTime"] == null ? null : DateTime.parse(json["showEndTime"]),
    ruleType: json["ruleType"],
    rule: json["rule"],
    tenantId: json["tenantId"],
    previewText: json["previewText"],
    status: json["status"],
    startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
    activityDetailSelect: json["activityDetailSelect"],
    statusIndex: json["statusIndex"],
    top: json["top"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "nameType": nameType,
    "nameParams": nameParams,
    "condition": condition,
    "category": category,
    "type": type,
    "bannerBackground": bannerBackground,
    "bannerLogo": bannerLogo,
    "sort": sort,
    "showStartTime": showStartTime?.toIso8601String(),
    "showEndTime": showEndTime?.toIso8601String(),
    "ruleType": ruleType,
    "rule": rule,
    "tenantId": tenantId,
    "previewText": previewText,
    "status": status,
    "startTime": startTime?.toIso8601String(),
    "endTime": endTime?.toIso8601String(),
    "activityDetailSelect": activityDetailSelect,
    "statusIndex": statusIndex,
    "top": top,
  };
}
