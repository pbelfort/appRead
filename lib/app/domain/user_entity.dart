class UserEntity {
  UserEntity({
    required this.uuid,
    required this.email,
    required this.emailVerified,
    required this.token,
  });

  final String uuid;
  final String email;
  final bool emailVerified;
  final String token;
}
