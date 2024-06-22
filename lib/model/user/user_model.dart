class User {
    User({
        required this.email,
        required this.password,
    });

    final String? email;
    final String? password;

    factory User.fromJson(Map<String, dynamic> json){ 
        return User(
            email: json["email"],
            password: json["password"],
        );
    }

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
    };

}
