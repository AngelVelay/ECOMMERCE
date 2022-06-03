class Signin {
  Signin({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory Signin.fromVoid() => Signin(
        username: '',
        password: '',
      );

  factory Signin.fromJson(Map<String, dynamic> json) => Signin(
        username: json["Name"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "Username": username,
        "Password": password,
      };
}
