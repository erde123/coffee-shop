class ModelUser {
    String id;
    String fullName;
    String email;
    dynamic gender;
    String phoneNumber;
    String image;
    dynamic dob;
    DateTime createdAt;
    int point;
    String partnerCode;

    ModelUser({
        required this.id,
        required this.fullName,
        required this.email,
        required this.gender,
        required this.phoneNumber,
        required this.image,
        required this.dob,
        required this.createdAt,
        required this.point,
        required this.partnerCode,
    });

    factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        gender: json["gender"],
        phoneNumber: json["phoneNumber"],
        image: json["image"],
        dob: json["dob"],
        createdAt: DateTime.parse(json["createdAt"]),
        point: json["point"],
        partnerCode: json["partnerCode"],
    );
}
