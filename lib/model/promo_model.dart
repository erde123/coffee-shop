class ModelPromo {
  final String promo, deskripsi, image;

  ModelPromo({
    required this.promo,
    required this.deskripsi,
    required this.image,
  });

    factory ModelPromo.fromJson(Map<String, dynamic> json) {
    return ModelPromo(
        promo: json['promo'],
        deskripsi: json['deskripsi'],
        image: json['image']);
  }
}