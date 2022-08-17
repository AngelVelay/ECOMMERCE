class Branch {
  Branch(
      {required this.id,
      required this.name,
      required this.address,
      required this.working_hours,
      required this.working_days,
      required this.phone,
      required this.active});

  int id;
  String name;
  String phone;
  String address;
  Map<String, dynamic> working_hours;
  String working_days;
  bool active;

  factory Branch.fromVoid() => Branch(
      id: 0,
      name: '',
      phone: '',
      active: false,
      address: '',
      working_hours: {},
      working_days: '');

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
      id: json["id"],
      name: json["name"],
      phone: json["phone"],
      active: json["active"],
      address: '',
      working_hours: {},
      working_days: '');

  Map<String, dynamic> toJson() =>
      {"id": id, "name": name, "phone": phone, "active": active};
}
