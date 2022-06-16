import 'package:flutter/material.dart';

enum Estatus { esperando, pagado, enCamino, entregado }

enum DeliveryType { envioADomicilio, retiroEnTienda }

class MyShopping {
  MyShopping(
      {required this.id,
      required this.name,
      required this.address,
      required this.compra,
      required this.costo,
      required this.puntos,
      required this.fecha,
      required this.estatus,
      required this.deliveryType});

  int id;
  String name;
  String address;
  String compra;
  String costo;
  String puntos;
  String fecha;
  Estatus estatus;
  DeliveryType deliveryType;

  factory MyShopping.fromVoid() => MyShopping(
        id: 1,
        name: '',
        address: '',
        compra: '',
        costo: '',
        puntos: '',
        fecha: '',
        estatus: Estatus.esperando,
        deliveryType: DeliveryType.retiroEnTienda,
      );

  factory MyShopping.fromJson(Map<String, dynamic> json) => MyShopping(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        compra: json["compra"],
        costo: json["costo"],
        puntos: json["puntos"],
        fecha: json["fecha"],
        estatus: json["estatus"],
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
        "estatus": estatus,
        "deliveryType": deliveryType,
      };
}
