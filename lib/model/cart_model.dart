class ModelCart {
    final String productId;
    final int quantity;
    final int subTotal;

    ModelCart({
        required this.productId,
        required this.quantity,
        required this.subTotal,
    });

    factory ModelCart.fromJson(Map<String, dynamic> json) => ModelCart(
        productId: json["_id"],
        quantity: json["quantity"],
        subTotal: json["subtotal"]
    );
}