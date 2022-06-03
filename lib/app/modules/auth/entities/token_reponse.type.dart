class TokenResponse {
  TokenResponse({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  String accessToken;
  String tokenType;
  int expiresIn;

  factory TokenResponse.fromJson(Map<String, dynamic> json) => TokenResponse(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
