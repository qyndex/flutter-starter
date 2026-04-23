class Profile {
  final String id;
  final String email;
  final String fullName;
  final String avatarUrl;
  final DateTime createdAt;

  const Profile({
    required this.id,
    required this.email,
    required this.fullName,
    required this.avatarUrl,
    required this.createdAt,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'] as String,
      email: (map['email'] as String?) ?? '',
      fullName: (map['full_name'] as String?) ?? '',
      avatarUrl: (map['avatar_url'] as String?) ?? '',
      createdAt: DateTime.parse(map['created_at'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'full_name': fullName,
      'avatar_url': avatarUrl,
    };
  }

  Profile copyWith({
    String? email,
    String? fullName,
    String? avatarUrl,
  }) {
    return Profile(
      id: id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt,
    );
  }
}
