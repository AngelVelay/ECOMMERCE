import 'package:flutter/material.dart';
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/main/entities/address.type.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';

class OrderStatusEnum {
  static int get pending => 1;
  static int get accepted => 2;
  static int get waiting => 3;
  static int get payed => 4;
  static int get onRoute => 5;
  static int get delivered => 6;
  static int get canceled => 7;
}

enum DeliveryType { envioADomicilio, retiroEnTienda }

class Order {
  Order(
      {required this.id,
      required this.name,
      required this.address,
      required this.total,
      required this.subtotal,
      required this.points,
      required this.date,
      required this.orderStatusId,
      required this.orderStatusName,
      required this.deliveryType,
      required this.deliveryAmount});

  int id;
  String name;
  String address;
  double subtotal;
  double deliveryAmount;
  double total;
  double points;
  String date;
  double? discount;
  DeliveryType deliveryType;
  String orderStatusName;
  int orderStatusId;
  Branch? pickupBranch;
  Address? deliveredAddress;
  CreditCard? paymentMethod;

  factory Order.fromVoid() => Order(
      id: 1,
      name: '',
      address: '',
      total: 0,
      subtotal: 0,
      points: 0,
      date: '',
      orderStatusId: 0,
      orderStatusName: '',
      deliveryType: DeliveryType.retiroEnTienda,
      deliveryAmount: 0);

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        total: json["total"],
        subtotal: json["subtotal"],
        points: json["points"],
        date: json["date"],
        orderStatusId: json["orderStatusId"],
        orderStatusName: json["orderStatusName"],
        deliveryType: json["deliveryType"],
        deliveryAmount: json["deliveryAmount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "total": total,
        "subtotal": subtotal,
        "points": points,
        "date": date,
        "orderStatusId": orderStatusId,
        "orderStatusName": orderStatusName,
        "deliveryType": deliveryType,
        "deliveryAmount": deliveryAmount,
      };
}
