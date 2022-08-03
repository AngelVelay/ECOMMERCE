class Address {
  Address({
    required this.id,
    required this.alias,
    required this.street,
    required this.outsideNumber,
    required this.insideNumber,
    required this.suburb,
    required this.town,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.isDefault,
    required this.contactName,
    required this.contactPhone,
    this.streetNotes,
    this.notes,
  });

  int id;
  String alias;
  String street;
  String outsideNumber;
  String insideNumber;
  String suburb;
  String town;
  String state;
  String country;
  String zipCode;
  bool isDefault;
  String contactName;
  String contactPhone;
  String? streetNotes;
  String? notes;

  factory Address.fromVoid() => Address(
      id: 0,
      alias: '',
      street: '',
      outsideNumber: '',
      insideNumber: '',
      suburb: '',
      town: '',
      state: '',
      country: '',
      zipCode: '',
      isDefault: false,
      contactName: '',
      contactPhone: '');

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        id: json["id"],
        alias: json["alias"],
        street: json["street"],
        outsideNumber: json["outsideNumber"],
        insideNumber: json["insideNumber"],
        suburb: json["suburb"],
        town: json["town"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zipCode"],
        isDefault: json["isDefault"],
        contactName: json["contactName"],
        contactPhone: json["contactPhone"],
        streetNotes: json["streetNotes"],
        notes: json["notes"],
      );

  Map<String, dynamic> toJson() => {
        // "id": id,
        // TODO
      };
}
