import 'dart:convert';

class SucursalType {
  SucursalType({
    required this.companyId,
    required this.company,
    required this.externalCode,
    required this.externalId,
    required this.icon,
    required this.geoIcon,
    required this.latitude,
    required this.longitude,
    required this.description,
    required this.name,
    required this.isActive,
    required this.isBySystem,
    required this.id,
    required this.isNew,
    required this.open,
    required this.horario,
    required this.tags,
    required this.telefono,
    required this.folio,
    required this.settingsId,
    required this.TypeiconTags,
  });

  String? companyId;
  String? company;
  String? horario;
  int? telefono;
  String? settingsId;
  String? externalCode;
  int? externalId;
  String? icon;
  String? geoIcon;
  String latitude;
  String longitude;
  String? description;
  String? name;
  bool? isActive;
  bool? isBySystem;
  String? id;
  int? folio;
  bool? isNew;
  bool? open;
  TagsType? tags;
  TagsIcon? TypeiconTags;

  factory SucursalType.fromRawJson(String str) =>
      SucursalType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SucursalType.fromJson(Map<String, dynamic> json) => SucursalType(
        name: json["name"],
        isActive: json["isActive"],
        isBySystem: json["isBySystem"],
        id: json["id"],
        isNew: json["isNew"],
        open: json["open"],
        horario: json["horario"],
        tags: json["tags"],
        telefono: json["telefono"],
        folio: json["folio"],
        settingsId: json["settingsId"],
        companyId: json["companyId"],
        company: json["company"],
        externalCode: json["externalCode"],
        externalId: json["externalId"],
        icon: json["icon"],
        geoIcon: json["geoIcon"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
        TypeiconTags: json["TypeiconTags"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "isActive": isActive,
        "isBySystem": isBySystem,
        "id": id,
        "isNew": isNew,
        "open": open,
        "horario": horario,
        "tags": tags,
        "telefono": telefono,
        "folio": folio,
        "settingsId": settingsId,
        "companyId": companyId,
        "company": company,
        "externalCode": externalCode,
        "externalId": externalId,
        "icon": icon,
        "geoIcon": geoIcon,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
      };
}

class TagsIcon {
  TagsIcon({
    required this.icon,
    required this.name,
    required this.group,
    required this.isActive,
  });

  String icon;
  String name;
  String group;
  bool isActive;

  factory TagsIcon.fromRawJson(String str) =>
      TagsIcon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TagsIcon.fromJson(Map<String, dynamic> json) => TagsIcon(
        icon: json["icon"],
        name: json["name"],
        group: json["group"],
        isActive: json["isActive"],
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "name": name,
        "group": group,
        "isActive": isActive,
      };
}

class TagsType {
  TagsType({
    required this.name,
    required this.group,
    required this.isActive,
    required this.isBySystem,
    required this.id,
    required this.isNew,
    required this.icon,
    required this.iconTags,
    required this.branchTagsId,
    required this.branchesConfigurationId,
    required this.fileLink,
  });

  int branchTagsId;
  String branchesConfigurationId;
  String fileLink;
  String group;
  int id;
  bool isActive;
  bool isBySystem;
  bool isNew;
  String name;
  TagsIcon iconTags;
  String icon;

  factory TagsType.fromRawJson(String str) =>
      TagsType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TagsType.fromJson(Map<String, dynamic> json) => TagsType(
        branchTagsId: json["branchTagsId"],
        branchesConfigurationId: json["branchesConfigurationId"],
        fileLink: json["fileLink"],
        group: json["group"],
        id: json["id"],
        isActive: json["isActive"],
        isBySystem: json["isBySystem"],
        isNew: json["isNew"],
        name: json["name"],
        iconTags: json["iconTags"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "branchTagsId": branchTagsId,
        "branchesConfigurationId": branchesConfigurationId,
        "fileLink": fileLink,
        "group": group,
        "id": id,
        "isActive": isActive,
        "isBySystem": isBySystem,
        "isNew": isNew,
        "name": name,
        "iconTags": iconTags,
        "icon": icon,
      };

  add(TagsType tagsType) {}
}
