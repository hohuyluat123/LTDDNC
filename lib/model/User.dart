class User {
  final int accountId;
  final String name;
  final String accessToken;
  final String refreshToken;
  final bool isSeller;

  User({
    required this.accountId,
    required this.name,
    required this.accessToken,
    required this.refreshToken,
    required this.isSeller,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      accountId: json['currentAccount']['id'] as int,
      name: json['currentAccount']['name'] as String,
      isSeller: json['currentAccount']['isSeller'] as bool,
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "accessToken": accessToken,
      "refreshToken": refreshToken,
      "currentAccount": {"id": accountId, "name": name, "isSeller": isSeller}
    };
  }

  @override
  String toString() {
    return 'User{accountId: $accountId, name: $name, accessToken: $accessToken, refreshToken: $refreshToken, isSeller: $isSeller}';
  }
}