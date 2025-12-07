import 'dart:convert';

ActivityRecordHistoryModel activityRecordHistoryModelFromJson(String str) => ActivityRecordHistoryModel.fromJson(json.decode(str));

String activityRecordHistoryModelToJson(ActivityRecordHistoryModel data) => json.encode(data.toJson());

class ActivityRecordHistoryModel {
  List<RecordList>? recordList;
  int? total;
  All? all;
  RandomAmount? randomAmount;

  ActivityRecordHistoryModel({
    this.recordList,
    this.total,
    this.all,
    this.randomAmount,
  });

  factory ActivityRecordHistoryModel.fromJson(Map<String, dynamic> json) => ActivityRecordHistoryModel(
    recordList: json["recordList"] == null ? [] : List<RecordList>.from(json["recordList"]!.map((x) => RecordList.fromJson(x))),
    total: json["total"],
    all: json["all"] == null ? null : All.fromJson(json["all"]),
    randomAmount: json["randomAmount"] == null ? null : RandomAmount.fromJson(json["randomAmount"]),
  );

  Map<String, dynamic> toJson() => {
    "recordList": recordList == null ? [] : List<dynamic>.from(recordList!.map((x) => x.toJson())),
    "total": total,
    "all": all?.toJson(),
    "randomAmount": randomAmount?.toJson(),
  };
}

class All {
  int? allAmount;

  All({
    this.allAmount,
  });

  factory All.fromJson(Map<String, dynamic> json) => All(
    allAmount: json["allAmount"],
  );

  Map<String, dynamic> toJson() => {
    "allAmount": allAmount,
  };
}

class RandomAmount {
  int? allMinAmount;
  int? allMaxAmount;

  RandomAmount({
    this.allMinAmount,
    this.allMaxAmount,
  });

  factory RandomAmount.fromJson(Map<String, dynamic> json) => RandomAmount(
    allMinAmount: json["allMinAmount"],
    allMaxAmount: json["allMaxAmount"],
  );

  Map<String, dynamic> toJson() => {
    "allMinAmount": allMinAmount,
    "allMaxAmount": allMaxAmount,
  };
}

class RecordList {
  DateTime? time;
  String? activityName;
  dynamic activityNameParams;
  ActivityNameType? activityNameType;
  String? activityType;
  int? awardCount;
  AwardType? awardType;
  String? remake;
  int? minAwardCount;
  int? maxAwardCount;

  RecordList({
    this.time,
    this.activityName,
    this.activityNameParams,
    this.activityNameType,
    this.activityType,
    this.awardCount,
    this.awardType,
    this.remake,
    this.minAwardCount,
    this.maxAwardCount,
  });

  factory RecordList.fromJson(Map<String, dynamic> json) => RecordList(
    time: json["time"] == null ? null : DateTime.parse(json["time"]),
    activityName: json["activityName"],
    activityNameParams: json["activityNameParams"],
    activityNameType: activityNameTypeValues.map[json["activityNameType"]]!,
    activityType: json["activityType"],
    awardCount: json["awardCount"],
    awardType: awardTypeValues.map[json["awardType"]]!,
    remake: json["remake"],
    minAwardCount: json["minAwardCount"],
    maxAwardCount: json["maxAwardCount"],
  );

  Map<String, dynamic> toJson() => {
    "time": time?.toIso8601String(),
    "activityName": activityName,
    "activityNameParams": activityNameParams,
    "activityNameType": activityNameTypeValues.reverse[activityNameType],
    "activityType": activityType,
    "awardCount": awardCount,
    "awardType": awardTypeValues.reverse[awardType],
    "remake": remake,
    "minAwardCount": minAwardCount,
    "maxAwardCount": maxAwardCount,
  };
}

class ActivityNameParamsClass {
  ActivityNameParamsClass();

  factory ActivityNameParamsClass.fromJson(Map<String, dynamic> json) => ActivityNameParamsClass(
  );

  Map<String, dynamic> toJson() => {
  };
}

enum ActivityNameType {
  CUSTOM,
  DEFAULT
}

final activityNameTypeValues = EnumValues({
  "CUSTOM": ActivityNameType.CUSTOM,
  "DEFAULT": ActivityNameType.DEFAULT
});

enum AwardType {
  BALANCE
}

final awardTypeValues = EnumValues({
  "BALANCE": AwardType.BALANCE
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
