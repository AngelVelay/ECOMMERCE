class Points {
  final int points;
  final int total;
  final int earned;
  final int spent;

  Points({
    required this.points,
    required this.total,
    required this.earned,
    required this.spent,
  });

  factory Points.fromJson(Map<String, dynamic> json) {
    return Points(
      points: json['points'],
      total: json['total'],
      earned: json['earned'],
      spent: json['spent'],
    );
  }

  factory Points.fromVoid() => Points(
        points: 0,
        total: 0,
        earned: 0,
        spent: 0,
      );

  Map<String, dynamic> toJson() => {
        "points": points,
        "total": total,
        "earned": earned,
        "spent": spent,
      };
}
