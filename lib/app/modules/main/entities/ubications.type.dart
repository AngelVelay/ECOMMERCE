class UbicationsObject {
  UbicationsObject({
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


  });

  String companyId;
  String? company;
  String externalCode;
  int externalId;
  String icon;
  String geoIcon;
  String latitude;
  String longitude;
  String description;
  String name;
  bool isActive;
  bool isBySystem;
  String id;
  bool isNew;

  factory UbicationsObject.fromJson(Map<String, dynamic> json) =>
      UbicationsObject(
        companyId: json["companyId"],
        company: json["company"],
        externalCode: json["externalCode"],
        externalId: json["externalId"],
        icon: json["icon"],
        geoIcon: json["geoIcon"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        description: json["description"],
        name: json["name"],
        isActive: json["isActive"],
        isBySystem: json["isBySystem"],
        id: json["id"],
        isNew: json["isNew"],
      );

  factory UbicationsObject.fromVoid() => UbicationsObject(
        companyId: '',
        company: '',
        externalCode: '',
        externalId: 0,
        icon: '',
        geoIcon: '',
        latitude: '',
        longitude: '',
        description: '',
        name: '',
        isActive: true,
        isBySystem: false,
        id: '',
        isNew: false,

      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "company": company,
        "externalCode": externalCode,
        "externalId": externalId,
        "icon": icon,
        "geoIcon": geoIcon,
        "latitude": latitude,
        "longitude": longitude,
        "description": description,
        "name": name,
        "isActive": isActive,
        "isBySystem": isBySystem,
        "id": id,
        "isNew": isNew
      };
}
