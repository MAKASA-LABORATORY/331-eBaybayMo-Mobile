class User {
  final String email;
  final String password;
  final String username;

  User({
    required this.email,
    required this.password,
    required this.username,
  });

  // Factory method to create a User from JSON
  factory User.fromJson(Map<String, dynamic> json) => User(
        email: json['email'],
        password: json['password'],
        username: json['username'],
      );

  // Method to convert User object to JSON
  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'username': username,
      };

  // CopyWith method
  User copyWith({
    String? email,
    String? password,
    String? username,
  }) {
    return User(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
    );
  }
}
