class ProductQueryParams {
  final String? name;
  final String? description;
  final String? barcode;
  final num? weight;
  final String? dimension;
  final String? expirationDate;
  final String? location;
  final String? manufacturer;
  final String? supplier;
  final bool? status;
  final num? price;
  final num? quantity;
  final String? category;
  final String? createdAt;

  ProductQueryParams({
    this.name,
    this.description,
    this.barcode,
    this.weight,
    this.dimension,
    this.expirationDate,
    this.location,
    this.manufacturer,
    this.supplier,
    this.status,
    this.price,
    this.quantity,
    this.category,
    this.createdAt,
  });
}
