class UserModel {
  final String name;
  final String email;
  final String password;
  final String language;
  final String city;
  final double latitude;
  final double longitude;

  UserModel(this.name, this.email, this.password, this.language, this.city,
      this.latitude, this.longitude);

  UserModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        password = json['password'],
        language = json['language'],
        city = json['city'],
        latitude = json['latitude'],
        longitude = json['longitude'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'language': language,
        'city': city,
        'latitude': latitude,
        'longitude': longitude,
      };
}
