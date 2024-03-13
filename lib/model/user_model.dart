class ModelUser {
  String? id, name, email, gender, phone, image, roles;
  String? birthday, createdAt;
  int? point = 0;
  //roles


  ModelUser({
    required this.id,
    required this.name,
    required this.email,
    this.gender,
    required this.phone,
    this.image,
    this.birthday,
    this.createdAt,
    this.point,
    this.roles,
  });

  factory ModelUser.fromJson(Map<String, dynamic> json) {
    return ModelUser(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        gender: json['gender'],
        phone: json['phone'],
        image: json['image'],
        birthday: json['birthday'],
        createdAt: json['createdAt'],
        point: json['point'],
        roles: json['roles']);
  }
}
