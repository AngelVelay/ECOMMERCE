import 'dart:convert';

class BranchesTags {
  BranchesTags({
    required this.fileLink,
    required this.fileId,
    required this.group,
    required this.name,
    required this.isActive,
    required this.isBySystem,
    required this.id,
    required this.isNew,
  });

  String fileLink;
  String fileId;
  String group;
  String name;
  bool isActive;
  bool isBySystem;
  int id;
  bool isNew;

  factory BranchesTags.fromRawJson(String str) =>
      BranchesTags.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BranchesTags.fromJson(Map<String, dynamic> json) => BranchesTags(
        fileLink: json["fileLink"],
        fileId: json["fileId"],
        group: json["group"],
        name: json["name"],
        isActive: json["isActive"],
        isBySystem: json["isBySystem"],
        id: json["id"],
        isNew: json["isNew"],
      );

  Map<String, dynamic> toJson() => {
        "fileLink": fileLink,
        "fileId": fileId,
        "group": group,
        "name": name,
        "isActive": isActive,
        "isBySystem": isBySystem,
        "id": id,
        "isNew": isNew,
      };
}
