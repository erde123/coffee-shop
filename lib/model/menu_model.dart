class ModelMenu {
  final String nama, deskripsi, harga, image, category;

  ModelMenu({
    required this.nama,
    required this.deskripsi,
    required this.harga,
    required this.image,
    required this.category,
  });

  factory ModelMenu.fromJson(Map<String, dynamic> json) {
    return ModelMenu(
        nama: json['nama'],
        deskripsi: json['deskripsi'],
        harga: json['harga'],
        image: json['image'],
        category: json['category']);
        
  }
}
