// class Flyer {
//   Flyer({required this.id, required this.url});

//   int id;
//   String url;

//   factory Flyer.fromJson(Map<String, dynamic> json) => Flyer(
//         id: json["id"],
//         url: json["url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "url": url,
//       };
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// Banner welcomeFromJson(String str) => Banner.fromJson(json.decode(str));

// String welcomeToJson(Banner data) => json.encode(data.toJson());

// class Banner {
//   Banner({
//     this.originalName,
//     this.extension,
//     this.mimeType,
//     this.valuePath,
//     this.valueBase64,
//     this.valueBytes,
//     this.additionalData,
//     this.folder,
//     this.thumbnailBase64,
//     this.thumbnailLink,
//     this.fileLink,
//     this.id,
//     this.isNew,
//   });

//   String? originalName;
//   String? extension;
//   String? mimeType;
//   String? valuePath;
//   dynamic valueBase64;
//   dynamic valueBytes;
//   dynamic? additionalData;
//   String? folder;
//   String? thumbnailBase64;
//   String? thumbnailLink;
//   String? fileLink;
//   int? id;
//   bool? isNew;

//   factory Banner.fromJson(Map<String, dynamic> json) => Banner(
//         originalName: json["originalName"],
//         extension: json["extension"],
//         mimeType: json["mimeType"],
//         valuePath: json["valuePath"],
//         valueBase64: json["valueBase64"],
//         valueBytes: json["valueBytes"],
//         additionalData: json["additionalData"],
//         folder: json["folder"],
//         thumbnailBase64: json["thumbnailBase64"],
//         thumbnailLink: json["thumbnailLink"],
//         fileLink: json["fileLink"],
//         id: json["id"],
//         isNew: json["isNew"],
//       );

//   Map<String, dynamic> toJson() => {
//         "originalName": originalName,
//         "extension": extension,
//         "mimeType": mimeType,
//         "valuePath": valuePath,
//         "valueBase64": valueBase64,
//         "valueBytes": valueBytes,
//         "additionalData": additionalData,
//         "folder": folder,
//         "thumbnailBase64": thumbnailBase64,
//         "thumbnailLink": thumbnailLink,
//         "fileLink": fileLink,
//         "id": id,
//         "isNew": isNew,
//       };
// }

import 'dart:convert';

class FileManger {
  FileManger({
    this.title,
    this.beginDate,
    this.endDate,
    required this.fileManagerId,
    this.name,
    this.isActive,
    this.isBySystem,
    this.id,
    this.isNew,
  });

  String? title;
  DateTime? beginDate;
  DateTime? endDate;
  String fileManagerId;
  String? name;
  bool? isActive;
  bool? isBySystem;
  int? id;
  bool? isNew;

  factory FileManger.fromJson(Map<String, dynamic> json) => FileManger(
        title: json["title"],
        beginDate: DateTime.parse(json["beginDate"]),
        endDate: DateTime.parse(json["endDate"]),
        fileManagerId: json["fileManagerId"],
        name: json["name"],
        isActive: json["isActive"],
        isBySystem: json["isBySystem"],
        id: json["id"],
        isNew: json["isNew"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "beginDate": beginDate.toString(),
        "endDate": endDate.toString(),
        "fileManagerId": fileManagerId,
        "name": name,
        "isActive": isActive,
        "isBySystem": isBySystem,
        "id": id,
        "isNew": isNew,
      };
}
