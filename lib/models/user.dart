class User {
  final String id;
  final String email;
  final String name;
  final String? profileImageUrl;

  User({
    required this.id,
    required this.email,
    required this.name,
    this.profileImageUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'profileImageUrl': profileImageUrl,
    };
  }

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? profileImageUrl,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
