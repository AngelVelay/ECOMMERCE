import 'dart:convert';

class QrCode {
  QrCode({
    this.id,
    required this.qrTypeId,
    required this.qrStatusId,
    required this.userId,
    required this.validEndDate,
    required this.validSeconds,
    this.appliedDate,
    this.appliedAdditionalData,
    this.additionalData,
  });

  String? id;
  int qrTypeId;
  int qrStatusId;
  int userId;
  DateTime validEndDate;
  int validSeconds;
  DateTime? appliedDate;
  String? appliedAdditionalData;
  String? additionalData;

  factory QrCode.fromRawJson(String str) => QrCode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QrCode.fromVoid() => QrCode(
      qrTypeId: 0,
      qrStatusId: 0,
      userId: 0,
      validEndDate: DateTime.now(),
      validSeconds: 0);

  factory QrCode.fromJson(Map<String, dynamic> json) => QrCode(
        id: json["id"],
        qrTypeId: json["qrTypeId"],
        qrStatusId: json["qrStatusId"],
        userId: json["userId"],
        validEndDate: DateTime.parse(json["validEndDate"]),
        validSeconds: json["validSeconds"],
        appliedDate: json["appliedDate"] != null
            ? DateTime.parse(json["appliedDate"])
            : null,
        appliedAdditionalData: json["appliedAdditionalData"] != null
            ? json["appliedAdditionalData"]
            : null,
        additionalData:
            json["additionalData"] != null ? json["additionalData"] : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "qrTypeId": qrTypeId,
        "qrStatusId": qrStatusId,
        "userId": userId,
        "validEndDate": validEndDate.toIso8601String(),
        "validSeconds": validSeconds,
        "appliedDate": appliedDate?.toIso8601String(),
        "appliedAdditionalData": appliedAdditionalData,
        "additionalData": additionalData,
      };
}
