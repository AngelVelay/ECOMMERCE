import 'dart:convert';
import 'package:jexpoints/app/core/data/entities/IEntityBase.dart';
import 'package:jexpoints/app/modules/auth/entities/membership.type.dart';

import 'employee.type.dart';

class User {
  User({
    required this.organizationId,
    required this.isActive,
    required this.username,
    required this.passwordSalt,
    required this.id,
    required this.membership,
    required this.phoneNumber,
    required this.name,
    this.employeeId,
    this.employee,
  });

  String organizationId;
  bool isActive;
  String username;
  String passwordSalt;
  String phoneNumber;
  String name;
  int id;
  String? employeeId;
  Employee? employee;
  String? code;
  Membership? membership;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  factory User.fromJson(Map<String, dynamic> json) => User(
        organizationId: json["organizationId"],
        isActive: json["isActive"],
        username: json["username"],
        passwordSalt: json["passwordSalt"],
        id: json["id"],
        phoneNumber: json["phoneNumber"],
        name: json["name"],
        employeeId: json["employeeId"],
        employee: json["employee"] == null
            ? null
            : Employee.fromJson(json["employee"]),
        membership: Membership.fromJson(json["membership"]),
      );

  Map<String, dynamic> toJson() => {
        "organizationId": organizationId,
        "isActive": isActive,
        "username": username,
        "passwordSalt": passwordSalt,
        "id": id,
        "phoneNumber": phoneNumber,
        "name": name,
        "employeeId": employeeId,
        "employee":
            employee == null ? null : Employee.fromJson(employee!.toJson()),
        "membership": Membership.fromJson(membership!.toJson()),
      };

  factory User.fromVoid() => User(
      organizationId: '',
      isActive: false,
      username: '',
      passwordSalt: '',
      id: 0,
      phoneNumber: '',
      name: '',
      membership: Membership.fromVoid());

  // @override
  // Future<User> fromRawJson<User>(String str) async =>
  //     T.fromJson(json.decode(str));
}
