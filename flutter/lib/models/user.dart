class UserModel {
  final int id;
  final String name;
  final String email;
  final String language;
  final String city;
  final double latitude;
  final double longitude;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.language,
      required this.city,
      required this.latitude,
      required this.longitude});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      name: json['name'],
      email: json['email'],
      language: json['language'],
      city: json['city'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}
