import 'package:flutter/material.dart';
import 'package:jexpoints/app/modules/auth/entities/branch.type.dart';
import 'package:jexpoints/app/modules/main/entities/address.type.dart';
import 'package:jexpoints/app/modules/main/entities/credit-card.dart';
import 'package:jexpoints/app/modules/main/views/payment-methods/payment-methods.page.dart';

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
      required this.compra,
      required this.costo,
      required this.puntos,
      required this.fecha,
      required this.orderStatusId,
      required this.orderStatusName,
      required this.deliveryType});

  int id;
  String name;
  String address;
  String compra;
  double costo;
  double puntos;
  String fecha;
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
        compra: '',
        costo: 0,
        puntos: 0,
        fecha: '',
        orderStatusId: 0,
        orderStatusName: '',
        deliveryType: DeliveryType.retiroEnTienda,
      );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        compra: json["compra"],
        costo: json["costo"],
        puntos: json["puntos"],
        fecha: json["fecha"],
        orderStatusId: json["orderStatusId"],
        orderStatusName: json["orderStatusName"],
        deliveryType: json["deliveryType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "compra": compra,
        "costo": costo,
        "puntos": puntos,
        "fecha": fecha,
        "orderStatusId": orderStatusId,
        "orderStatusName": orderStatusName,
        "deliveryType": deliveryType,
      };
}
