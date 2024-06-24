// The UserModel is designed to represents the user information returned by the 
// server after login attempt

class UserModel {
  UserModel({
    this.token,
    this.error,
    this.email,
  });

  final String? email;
  final String? token;
  final String? error;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json["email"],
      token: json["token"] ?? "",
      error: json["error"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "email": email,
        "token": token,
        "error": error,
      };
}
