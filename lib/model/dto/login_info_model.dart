import 'dart:convert';

LoginInfoModel loginInfoModelFromJson(String str) => LoginInfoModel.fromJson(json.decode(str));

String loginInfoModelToJson(LoginInfoModel data) => json.encode(data.toJson());

class LoginInfoModel {
  int? userId;
  int? tenantId;
  String? token;
  int? giftTrialPlayAmount;
  String? trialPlayAmountType;

  LoginInfoModel({
    this.userId,
    this.tenantId,
    this.token,
    this.giftTrialPlayAmount,
    this.trialPlayAmountType,
  });

  factory LoginInfoModel.fromJson(Map<String, dynamic> json) => LoginInfoModel(
    userId: json["userId"],
    tenantId: json["tenantId"],
    token: json["token"],
    giftTrialPlayAmount: json["giftTrialPlayAmount"],
    trialPlayAmountType: json["trialPlayAmountType"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "tenantId": tenantId,
    "token": token,
    "giftTrialPlayAmount": giftTrialPlayAmount,
    "trialPlayAmountType": trialPlayAmountType,
  };
}
