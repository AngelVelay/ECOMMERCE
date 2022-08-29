import 'dart:convert';

Banners bannerFromJson(String str) => Banners.fromJson(json.decode(str));

String bannerToJson(Banners data) => json.encode(data.toJson());

class Banners {
  Banners({
    this.fileObjectTypeId,
    this.organizationId,
    this.originalName,
    this.extension,
    this.mimeType,
    this.valuePath,
    this.valueBase64,
    this.valueBytes,
    this.additionalData,
    this.folder,
    this.thumbnailBase64,
    required this.thumbnailLink,
    required this.fileLink,
    this.id,
    this.isNew,
  });

  int? fileObjectTypeId;
  String? organizationId;
  // Organization organization;
  String? originalName;
  String? extension;
  String? mimeType;
  String? valuePath;
  dynamic valueBase64;
  dynamic valueBytes;
  dynamic additionalData;
  String? folder;
  String? thumbnailBase64;
  String thumbnailLink;
  String fileLink;
  String? id;
  bool? isNew;

  factory Banners.fromJson(Map<String, dynamic> json) => Banners(
        fileObjectTypeId: json["fileObjectTypeId"],
        organizationId: json["organizationId"],
        originalName: json["originalName"],
        extension: json["extension"],
        mimeType: json["mimeType"],
        valuePath: json["valuePath"],
        valueBase64: json["valueBase64"],
        valueBytes: json["valueBytes"],
        additionalData: json["additionalData"],
        folder: json["folder"],
        thumbnailBase64: json["thumbnailBase64"],
        thumbnailLink: json["thumbnailLink"],
        fileLink: json["fileLink"],
        id: json["id"],
        isNew: json["isNew"],
      );

  Map<String, dynamic> toJson() => {
        "fileObjectTypeId": fileObjectTypeId,
        "organizationId": organizationId,
        "originalName": originalName,
        "extension": extension,
        "mimeType": mimeType,
        "valuePath": valuePath,
        "valueBase64": valueBase64,
        "valueBytes": valueBytes,
        "additionalData": additionalData,
        "folder": folder,
        "thumbnailBase64": thumbnailBase64,
        "thumbnailLink": thumbnailLink,
        "fileLink": fileLink,
        "id": id,
        "isNew": isNew,
      };
}

// class FileObjectType {
//   FileObjectType({
//     this.fileHandleTypeId,
//     this.fileHandleType,
//     this.applicationId,
//     this.application,
//     this.folderName,
//     this.validExtensions,
//     this.maxSizeKb,
//     this.thumbWidth,
//     this.thumbHeight,
//     this.name,
//     this.isActive,
//     this.isBySystem,
//     this.id,
//     this.isNew,
//   });

//   int? fileHandleTypeId;
//   dynamic fileHandleType;
//   String? applicationId;
//   FileObjectTypeApplication? application;
//   String? folderName;
//   dynamic validExtensions;
//   int? maxSizeKb;
//   int? thumbWidth;
//   int? thumbHeight;
//   String? name;
//   bool? isActive;
//   bool? isBySystem;
//   int? id;
//   bool? isNew;

//   factory FileObjectType.fromJson(Map<String, dynamic> json) => FileObjectType(
//         fileHandleTypeId: json["fileHandleTypeId"],
//         fileHandleType: json["fileHandleType"],
//         applicationId: json["applicationId"],
//         application: FileObjectTypeApplication.fromJson(json["application"]),
//         folderName: json["folderName"],
//         validExtensions: json["validExtensions"],
//         maxSizeKb: json["maxSizeKb"],
//         thumbWidth: json["thumbWidth"],
//         thumbHeight: json["thumbHeight"],
//         name: json["name"],
//         isActive: json["isActive"],
//         isBySystem: json["isBySystem"],
//         id: json["id"],
//         isNew: json["isNew"],
//       );

//   Map<String, dynamic> toJson() => {
//         "fileHandleTypeId": fileHandleTypeId,
//         "fileHandleType": fileHandleType,
//         "applicationId": applicationId,
//         "application": application,
//         "folderName": folderName,
//         "validExtensions": validExtensions,
//         "maxSizeKb": maxSizeKb,
//         "thumbWidth": thumbWidth,
//         "thumbHeight": thumbHeight,
//         "name": name,
//         "isActive": isActive,
//         "isBySystem": isBySystem,
//         "id": id,
//         "isNew": isNew,
//       };
// }

// class FileObjectTypeApplication {
//   FileObjectTypeApplication({
//     this.url,
//     this.logo,
//     this.colorCode,
//     this.name,
//     this.isActive,
//     this.isBySystem,
//     this.id,
//     this.isNew,
//   });

//   String? url;
//   String? logo;
//   String? colorCode;
//   String? name;
//   bool? isActive;
//   bool? isBySystem;
//   String? id;
//   bool? isNew;

//   factory FileObjectTypeApplication.fromJson(Map<String, dynamic> json) =>
//       FileObjectTypeApplication(
//         url: json["url"],
//         logo: json["logo"],
//         colorCode: json["colorCode"],
//         name: json["name"],
//         isActive: json["isActive"],
//         isBySystem: json["isBySystem"],
//         id: json["id"],
//         isNew: json["isNew"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//         "logo": logo,
//         "colorCode": colorCode,
//         "name": name,
//         "isActive": isActive,
//         "isBySystem": isBySystem,
//         "id": id,
//         "isNew": isNew,
//       };
// }

// class Organization {
//   Organization({
//     this.shortName,
//     this.maxUsers,
//     this.concurrentMaxUsers,
//     this.logoFileId,
//     this.loadingFileId,
//     this.companies,
//     this.employees,
//     this.users,
//     this.applications,
//     this.logoFile,
//     this.loadingFile,
//     this.name,
//     this.isActive,
//     this.isBySystem,
//     this.id,
//     this.isNew,
//   });

//   String? shortName;
//   int? maxUsers;
//   int? concurrentMaxUsers;
//   dynamic logoFileId;
//   dynamic loadingFileId;
//   List<dynamic>? companies;
//   List<dynamic>? employees;
//   List<dynamic>? users;
//   List<ApplicationElement>? applications;
//   dynamic logoFile;
//   dynamic loadingFile;
//   String? name;
//   bool? isActive;
//   bool? isBySystem;
//   String? id;
//   bool? isNew;

//   factory Organization.fromJson(Map<String, dynamic> json) => Organization(
//         shortName: json["shortName"],
//         maxUsers: json["maxUsers"],
//         concurrentMaxUsers: json["concurrentMaxUsers"],
//         logoFileId: json["logoFileId"],
//         loadingFileId: json["loadingFileId"],
//         companies: List<dynamic>.from(json["companies"].map((x) => x)),
//         employees: List<dynamic>.from(json["employees"].map((x) => x)),
//         users: List<dynamic>.from(json["users"].map((x) => x)),
//         applications: List<ApplicationElement>.from(
//             json["applications"].map((x) => ApplicationElement.fromJson(x))),
//         logoFile: json["logoFile"],
//         loadingFile: json["loadingFile"],
//         name: json["name"],
//         isActive: json["isActive"],
//         isBySystem: json["isBySystem"],
//         id: json["id"],
//         isNew: json["isNew"],
//       );

//   Map<String, dynamic> toJson() => {
//         "shortName": shortName,
//         "maxUsers": maxUsers,
//         "concurrentMaxUsers": concurrentMaxUsers,
//         "logoFileId": logoFileId,
//         "loadingFileId": loadingFileId,
//         "companies": List<dynamic>.from(companies!.map((x) => x)),
//         "employees": List<dynamic>.from(employees!.map((x) => x)),
//         "users": List<dynamic>.from(users!.map((x) => x)),
//         "applications":
//             List<dynamic>.from(applications!.map((x) => x.toJson())),
//         "logoFile": logoFile,
//         "loadingFile": loadingFile,
//         "name": name,
//         "isActive": isActive,
//         "isBySystem": isBySystem,
//         "id": id,
//         "isNew": isNew,
//       };
// }

// class ApplicationElement {
//   ApplicationElement({
//     required this.organizationId,
//     this.organization,
//     required this.applicationId,
//     required this.application,
//     this.customUrl,
//     this.customLogo,
//     this.customLogoTitle,
//     required this.isActive,
//     required this.keys,
//     required this.id,
//     required this.isNew,
//   });

//   String organizationId;
//   dynamic organization;
//   String applicationId;
//   FileObjectTypeApplication application;
//   dynamic customUrl;
//   dynamic customLogo;
//   dynamic customLogoTitle;
//   bool isActive;
//   List<Key> keys;
//   String id;
//   bool isNew;

//   factory ApplicationElement.fromJson(Map<String, dynamic> json) =>
//       ApplicationElement(
//         organizationId: json["organizationId"],
//         organization: json["organization"],
//         applicationId: json["applicationId"],
//         application: FileObjectTypeApplication.fromJson(json["application"]),
//         customUrl: json["customUrl"],
//         customLogo: json["customLogo"],
//         customLogoTitle: json["customLogoTitle"],
//         isActive: json["isActive"],
//         keys: List<Key>.from(json["keys"].map((x) => Key.fromJson(x))),
//         id: json["id"],
//         isNew: json["isNew"],
//       );

//   Map<String, dynamic> toJson() => {
//         "organizationId": organizationId,
//         "organization": organization,
//         "applicationId": applicationId,
//         "application": application.toJson(),
//         "customUrl": customUrl,
//         "customLogo": customLogo,
//         "customLogoTitle": customLogoTitle,
//         "isActive": isActive,
//         "keys": List<dynamic>.from(keys.map((x) => x.toJson())),
//         "id": id,
//         "isNew": isNew,
//       };
// }

// class Key {
//   Key({
//     required this.organizationApplicationId,
//     this.organizationApplication,
//     required this.validInitDate,
//     required this.validEndDate,
//     required this.isActive,
//     required this.id,
//     required this.isNew,
//   });

//   String organizationApplicationId;
//   dynamic organizationApplication;
//   DateTime validInitDate;
//   DateTime validEndDate;
//   bool isActive;
//   String id;
//   bool isNew;

//   factory Key.fromJson(Map<String, dynamic> json) => Key(
//         organizationApplicationId: json["organizationApplicationId"],
//         organizationApplication: json["organizationApplication"],
//         validInitDate: DateTime.parse(json["validInitDate"]),
//         validEndDate: DateTime.parse(json["validEndDate"]),
//         isActive: json["isActive"],
//         id: json["id"],
//         isNew: json["isNew"],
//       );

//   Map<String, dynamic> toJson() => {
//         "organizationApplicationId": organizationApplicationId,
//         "organizationApplication": organizationApplication,
//         "validInitDate": validInitDate.toIso8601String(),
//         "validEndDate": validEndDate.toIso8601String(),
//         "isActive": isActive,
//         "id": id,
//         "isNew": isNew,
//       };
