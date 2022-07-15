import 'dart:convert';

class Membership {
  Membership({
    required this.cardNumber,
    required this.levelName,
    required this.points,
    required this.levelPercentage,
    required this.nextLevel,
    required this.nextLevelPoints,
    required this.pointsValue,
  });

  String cardNumber;
  String levelName;
  int points;
  double pointsValue;
  double levelPercentage;
  int nextLevelPoints;
  String nextLevel;

  factory Membership.fromRawJson(String str) =>
      Membership.fromJson(json.decode(str));

  factory Membership.fromJson(Map<String, dynamic> json) => Membership(
        cardNumber: json["cardNumber"],
        levelName: json["levelName"],
        points: json["points"],
        levelPercentage: json["levelPercentage"],
        nextLevelPoints: json["nextLevelPoints"],
        nextLevel: json["nextLevel"],
        pointsValue: json["pointsValue"],
      );

  Map<String, dynamic> toJson() => {
        "cardNumber": cardNumber,
        "levelName": levelName,
        "points": points,
        "nextLevelPoints": nextLevelPoints,
        "nextLevel": nextLevel,
        "levelPercentage": levelPercentage,
        "pointsValue": pointsValue,
      };

  factory Membership.fromVoid() => Membership(
      cardNumber: '',
      levelName: '',
      points: 0,
      nextLevelPoints: 0,
      nextLevel: '',
      levelPercentage: 0,
      pointsValue: 0);
}
