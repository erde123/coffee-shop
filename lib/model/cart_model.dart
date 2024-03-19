class ModelCart {
    final String productId;
    final int quantity;

    ModelCart({
        required this.productId,
        required this.quantity,
    });

    factory ModelCart.fromJson(Map<String, dynamic> json) => ModelCart(
        productId: json["product_id"],
        quantity: json["quantity"],
    );
}