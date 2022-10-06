import 'dart:convert';

class ApiException {
  ApiException({
    required this.message,
    required this.messageDetail,
    required this.exceptionMessage,
    required this.exceptionType,
    required this.stackTrace,
  });

  String message;
  String messageDetail;
  String exceptionMessage;
  String exceptionType;
  String stackTrace;

  factory ApiException.fromRawJson(String str) =>
      ApiException.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ApiException.fromJson(Map<String, dynamic> json) => ApiException(
        message: json["message"],
        messageDetail: json["messageDetail"],
        exceptionMessage: json["exceptionMessage"],
        exceptionType: json["exceptionType"],
        stackTrace: json["stackTrace"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "messageDetail": messageDetail,
        "exceptionMessage": exceptionMessage,
        "exceptionType": exceptionType,
        "stackTrace": stackTrace,
      };
}
