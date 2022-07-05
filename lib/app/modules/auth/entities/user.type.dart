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
    this.employeeId,
    this.employee,
    this.phoneNumber,
  });

  String organizationId;
  bool isActive;
  String username;
  String passwordSalt;
  String? phoneNumber;
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
      membership: Membership.fromVoid());

  // @override
  // Future<User> fromRawJson<User>(String str) async =>
  //     T.fromJson(json.decode(str));
}
