import 'dart:convert';

List<MainMediaListModel> mainMediaListModelFromJson(String str) => List<MainMediaListModel>.from(json.decode(str).map((x) => MainMediaListModel.fromJson(x)));

String mainMediaListModelToJson(List<MainMediaListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MainMediaListModel {
  int? id;
  String? type;
  String? link;
  String? icon;

  MainMediaListModel({
    this.id,
    this.type,
    this.link,
    this.icon,
  });

  factory MainMediaListModel.fromJson(Map<String, dynamic> json) => MainMediaListModel(
    id: json["id"],
    type: json["type"],
    link: json["link"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "link": link,
    "icon": icon,
  };
}
