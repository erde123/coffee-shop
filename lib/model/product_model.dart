class ModelProduct {
  final String id, nama, deskripsi, harga, image, category;

  ModelProduct({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.image,
    required this.category,
  });

  factory ModelProduct.fromJson(Map<String, dynamic> json) {
    return ModelProduct(
        id: json['id'],
        nama: json['nama'],
        deskripsi: json['deskripsi'],
        harga: json['harga'],
        image: json['image'],
        category: json['category']);
  }
}
