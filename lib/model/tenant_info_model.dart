import 'dart:convert';

TenantInfoModel tenantInfoModelFromJson(String str) => TenantInfoModel.fromJson(json.decode(str));

String tenantInfoModelToJson(TenantInfoModel data) => json.encode(data.toJson());

class TenantInfoModel {
  String? withdrawPasswordAuthMethod;
  int? id;
  String? name;
  bool? enabled;
  String? skinType;
  String? skinTwoType;
  String? homeType;
  Region? region;
  String? siteName;
  String? appIcon;
  String? siteLogo;
  String? paymentPartnerPic;
  List<String>? appLanguage;
  String? appDefaultLanguage;
  String? pwaInstallType;
  String? jpushAppKey;
  int? reportTimeRange;
  String? gamePartnerPic;
  String? openNoticeTextType;
  String? openNoticeText;
  String? sidebarBannerStyle;
  String? gameLogoStyle;
  String? gameLogoLanguage;
  String? homeVideoSwitch;
  String? homeVideoUrl;
  String? homeNavType;
  bool? allowUserChangePassword;
  bool? allowChangeAssetPassword;
  bool? allowChangePhone;
  bool? allowChangeEmail;
  bool? allowEmailPhoneLogin;
  bool? registerBindGcashMaya;
  bool? needAge;
  String? buttonShowAmount;
  bool? rewardSwitch;
  bool? tenantInfoModelSwitch;
  String? background;
  String? previewText;
  Target? target;
  List<PrizePoolValuesList>? prizePoolValuesList;
  String? announcementPopupWay;
  String? announcementLabelStyle;
  String? gameLogoUrl;
  String? currencySymbol;
  AvatarBucket? avatarBucket;
  RankConfig? rankConfig;

  TenantInfoModel({
    this.withdrawPasswordAuthMethod,
    this.id,
    this.name,
    this.enabled,
    this.skinType,
    this.skinTwoType,
    this.homeType,
    this.region,
    this.siteName,
    this.appIcon,
    this.siteLogo,
    this.paymentPartnerPic,
    this.appLanguage,
    this.appDefaultLanguage,
    this.pwaInstallType,
    this.jpushAppKey,
    this.reportTimeRange,
    this.gamePartnerPic,
    this.openNoticeTextType,
    this.openNoticeText,
    this.sidebarBannerStyle,
    this.gameLogoStyle,
    this.gameLogoLanguage,
    this.homeVideoSwitch,
    this.homeVideoUrl,
    this.homeNavType,
    this.allowUserChangePassword,
    this.allowChangeAssetPassword,
    this.allowChangePhone,
    this.allowChangeEmail,
    this.allowEmailPhoneLogin,
    this.registerBindGcashMaya,
    this.needAge,
    this.buttonShowAmount,
    this.rewardSwitch,
    this.tenantInfoModelSwitch,
    this.background,
    this.previewText,
    this.target,
    this.prizePoolValuesList,
    this.announcementPopupWay,
    this.announcementLabelStyle,
    this.gameLogoUrl,
    this.currencySymbol,
    this.avatarBucket,
    this.rankConfig,
  });

  factory TenantInfoModel.fromJson(Map<String, dynamic> json) => TenantInfoModel(
    withdrawPasswordAuthMethod: json["withdrawPasswordAuthMethod"],
    id: json["id"],
    name: json["name"],
    enabled: json["enabled"],
    skinType: json["skinType"],
    skinTwoType: json["skinTwoType"],
    homeType: json["homeType"],
    region: json["region"] == null ? null : Region.fromJson(json["region"]),
    siteName: json["siteName"],
    appIcon: json["appIcon"],
    siteLogo: json["siteLogo"],
    paymentPartnerPic: json["paymentPartnerPic"],
    appLanguage: json["appLanguage"] == null ? [] : List<String>.from(json["appLanguage"]!.map((x) => x)),
    appDefaultLanguage: json["appDefaultLanguage"],
    pwaInstallType: json["pwaInstallType"],
    jpushAppKey: json["jpushAppKey"],
    reportTimeRange: json["reportTimeRange"],
    gamePartnerPic: json["gamePartnerPic"],
    openNoticeTextType: json["openNoticeTextType"],
    openNoticeText: json["openNoticeText"],
    sidebarBannerStyle: json["sidebarBannerStyle"],
    gameLogoStyle: json["gameLogoStyle"],
    gameLogoLanguage: json["gameLogoLanguage"],
    homeVideoSwitch: json["homeVideoSwitch"],
    homeVideoUrl: json["homeVideoUrl"],
    homeNavType: json["homeNavType"],
    allowUserChangePassword: json["allowUserChangePassword"],
    allowChangeAssetPassword: json["allowChangeAssetPassword"],
    allowChangePhone: json["allowChangePhone"],
    allowChangeEmail: json["allowChangeEmail"],
    allowEmailPhoneLogin: json["allowEmailPhoneLogin"],
    registerBindGcashMaya: json["registerBindGcashMaya"],
    needAge: json["needAge"],
    buttonShowAmount: json["buttonShowAmount"],
    rewardSwitch: json["rewardSwitch"],
    tenantInfoModelSwitch: json["switch"],
    background: json["background"],
    previewText: json["previewText"],
    target: json["target"] == null ? null : Target.fromJson(json["target"]),
    prizePoolValuesList: json["prizePoolValuesList"] == null ? [] : List<PrizePoolValuesList>.from(json["prizePoolValuesList"]!.map((x) => PrizePoolValuesList.fromJson(x))),
    announcementPopupWay: json["announcementPopupWay"],
    announcementLabelStyle: json["announcementLabelStyle"],
    gameLogoUrl: json["gameLogoUrl"],
    currencySymbol: json["currencySymbol"],
    avatarBucket: json["avatarBucket"] == null ? null : AvatarBucket.fromJson(json["avatarBucket"]),
    rankConfig: json["rankConfig"] == null ? null : RankConfig.fromJson(json["rankConfig"]),
  );

  Map<String, dynamic> toJson() => {
    "withdrawPasswordAuthMethod": withdrawPasswordAuthMethod,
    "id": id,
    "name": name,
    "enabled": enabled,
    "skinType": skinType,
    "skinTwoType": skinTwoType,
    "homeType": homeType,
    "region": region?.toJson(),
    "siteName": siteName,
    "appIcon": appIcon,
    "siteLogo": siteLogo,
    "paymentPartnerPic": paymentPartnerPic,
    "appLanguage": appLanguage == null ? [] : List<dynamic>.from(appLanguage!.map((x) => x)),
    "appDefaultLanguage": appDefaultLanguage,
    "pwaInstallType": pwaInstallType,
    "jpushAppKey": jpushAppKey,
    "reportTimeRange": reportTimeRange,
    "gamePartnerPic": gamePartnerPic,
    "openNoticeTextType": openNoticeTextType,
    "openNoticeText": openNoticeText,
    "sidebarBannerStyle": sidebarBannerStyle,
    "gameLogoStyle": gameLogoStyle,
    "gameLogoLanguage": gameLogoLanguage,
    "homeVideoSwitch": homeVideoSwitch,
    "homeVideoUrl": homeVideoUrl,
    "homeNavType": homeNavType,
    "allowUserChangePassword": allowUserChangePassword,
    "allowChangeAssetPassword": allowChangeAssetPassword,
    "allowChangePhone": allowChangePhone,
    "allowChangeEmail": allowChangeEmail,
    "allowEmailPhoneLogin": allowEmailPhoneLogin,
    "registerBindGcashMaya": registerBindGcashMaya,
    "needAge": needAge,
    "buttonShowAmount": buttonShowAmount,
    "rewardSwitch": rewardSwitch,
    "switch": tenantInfoModelSwitch,
    "background": background,
    "previewText": previewText,
    "target": target?.toJson(),
    "prizePoolValuesList": prizePoolValuesList == null ? [] : List<dynamic>.from(prizePoolValuesList!.map((x) => x.toJson())),
    "announcementPopupWay": announcementPopupWay,
    "announcementLabelStyle": announcementLabelStyle,
    "gameLogoUrl": gameLogoUrl,
    "currencySymbol": currencySymbol,
    "avatarBucket": avatarBucket?.toJson(),
    "rankConfig": rankConfig?.toJson(),
  };
}

class AvatarBucket {
  String? url;
  String? female;
  String? male;

  AvatarBucket({
    this.url,
    this.female,
    this.male,
  });

  factory AvatarBucket.fromJson(Map<String, dynamic> json) => AvatarBucket(
    url: json["url"],
    female: json["female"],
    male: json["male"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "female": female,
    "male": male,
  };
}

class PrizePoolValuesList {
  int? time;
  int? prizePoolValue;

  PrizePoolValuesList({
    this.time,
    this.prizePoolValue,
  });

  factory PrizePoolValuesList.fromJson(Map<String, dynamic> json) => PrizePoolValuesList(
    time: json["time"],
    prizePoolValue: json["prizePoolValue"],
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "prizePoolValue": prizePoolValue,
  };
}

class RankConfig {
  bool? userRankSwitch;

  RankConfig({
    this.userRankSwitch,
  });

  factory RankConfig.fromJson(Map<String, dynamic> json) => RankConfig(
    userRankSwitch: json["userRankSwitch"],
  );

  Map<String, dynamic> toJson() => {
    "userRankSwitch": userRankSwitch,
  };
}

class Region {
  int? id;
  String? name;
  String? timezone;
  String? currency;
  String? language;
  int? rechargeRatio;
  String? phoneCode;
  String? code;
  String? withdrawalConfig;

  Region({
    this.id,
    this.name,
    this.timezone,
    this.currency,
    this.language,
    this.rechargeRatio,
    this.phoneCode,
    this.code,
    this.withdrawalConfig,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
    id: json["id"],
    name: json["name"],
    timezone: json["timezone"],
    currency: json["currency"],
    language: json["language"],
    rechargeRatio: json["rechargeRatio"],
    phoneCode: json["phoneCode"],
    code: json["code"],
    withdrawalConfig: json["withdrawalConfig"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "timezone": timezone,
    "currency": currency,
    "language": language,
    "rechargeRatio": rechargeRatio,
    "phoneCode": phoneCode,
    "code": code,
    "withdrawalConfig": withdrawalConfig,
  };
}

class Target {
  String? type;
  TargetValue? targetValue;

  Target({
    this.type,
    this.targetValue,
  });

  factory Target.fromJson(Map<String, dynamic> json) => Target(
    type: json["type"],
    targetValue: json["targetValue"] == null ? null : TargetValue.fromJson(json["targetValue"]),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "targetValue": targetValue?.toJson(),
  };
}

class TargetValue {
  String? type;
  String? info;

  TargetValue({
    this.type,
    this.info,
  });

  factory TargetValue.fromJson(Map<String, dynamic> json) => TargetValue(
    type: json["type"],
    info: json["info"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "info": info,
  };
}
