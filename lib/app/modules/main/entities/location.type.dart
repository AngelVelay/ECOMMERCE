class Address {
  Address({
    required this.id,
    required this.name,
    required this.zipcode,
    required this.street,
    required this.number,
    required this.isDefault,
    this.internalNumber,
  });

  int id;
  String name;
  String zipcode;
  String street;
  String number;
  bool isDefault;
  String? internalNumber;

  factory Address.fromVoid() => Address(
      id: 1, name: '', zipcode: '', street: '', number: '', isDefault: false);

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        name: json["name"],
        zipcode: json["zipcode"],
        street: json["street"],
        number: json["number"],
        isDefault: json["isDefault"],
        internalNumber: json["internalNumber"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // TODO
      };
}
