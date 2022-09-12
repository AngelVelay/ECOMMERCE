// To parse this JSON data, do
//
//     final posters = postersFromJson(jsonString);

import 'dart:convert';

class Posters {
  Posters({
    required this.title,
    required this.description,
    required this.appFileManagerId,
    required this.appFileManagerThumbnail,
    required this.webAppFileManagerId,
    required this.webAppFileManagerThumbnail,
    required this.beginDate,
    required this.endDate,
    required this.terms,
    required this.isWeb,
    required this.isApp,
    required this.name,
    required this.isActive,
    required this.isBySystem,
    required this.id,
    required this.isNew,
  });

  String title;
  String description;
  String appFileManagerId;
  String? appFileManagerThumbnail;
  String? webAppFileManagerId;
  String? webAppFileManagerThumbnail;
  DateTime beginDate;
  DateTime endDate;
  String terms;
  bool isWeb;
  bool isApp;
  String name;
  bool isActive;
  bool isBySystem;
  int id;
  bool isNew;

  factory Posters.fromRawJson(String str) => Posters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Posters.fromJson(Map<String, dynamic> json) => Posters(
        title: json["title"],
        description: json["description"],
        appFileManagerId: json["appFileManagerId"],
        appFileManagerThumbnail: json["appFileManagerThumbnail"],
        webAppFileManagerId: json["webAppFileManagerId"],
        webAppFileManagerThumbnail: json["webAppFileManagerThumbnail"],
        beginDate: DateTime.parse(json["beginDate"]),
        endDate: DateTime.parse(json["endDate"]),
        terms: json["terms"],
        isWeb: json["isWeb"],
        isApp: json["isApp"],
        name: json["name"],
        isActive: json["isActive"],
        isBySystem: json["isBySystem"],
        id: json["id"],
        isNew: json["isNew"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "appFileManagerId": appFileManagerId,
        "appFileManagerThumbnail": appFileManagerThumbnail,
        "webAppFileManagerId": webAppFileManagerId,
        "webAppFileManagerThumbnail": webAppFileManagerThumbnail,
        "beginDate": beginDate.toIso8601String(),
        "endDate": endDate.toIso8601String(),
        "terms": terms,
        "isWeb": isWeb,
        "isApp": isApp,
        "name": name,
        "isActive": isActive,
        "isBySystem": isBySystem,
        "id": id,
        "isNew": isNew,
      };
}
