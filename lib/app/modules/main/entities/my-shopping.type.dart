import 'package:flutter/material.dart';

enum Estatus {
  pendiente,
  aceptado,
  esperando,
  pagado,
  enCamino,
  entregado,
  cancelado
}

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
  DeliveryType deliveryType;
  Map<Estatus, String>? estatus;

  factory MyShopping.fromVoid() => MyShopping(
        id: 1,
        name: '',
        address: '',
        compra: '',
        costo: '',
        puntos: '',
        fecha: '',
        estatus: {
          Estatus.pendiente: 'Pendiente',
          Estatus.aceptado: 'Aceptado',
          Estatus.esperando: 'Esperando',
          Estatus.pagado: 'Pagado',
          Estatus.enCamino: 'En camino',
          Estatus.entregado: 'Entregado',
          Estatus.cancelado: 'Cancelado',
        },
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
