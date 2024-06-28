class Supplier {
  final int? id;
  final String name;
  final String? icon;
  final String? description;
  final String? address;
  final String? website;
  final String? contactEmail;
  final String? contactPhone;
  final String? country;
  final String? city;
  final bool status;
  final String? color;
  final DateTime createdAt;
  final DateTime updatedAt;

  Supplier({
    this.id,
    required this.name,
    this.icon,
    this.description,
    this.address,
    this.website,
    this.contactEmail,
    this.contactPhone,
    this.country,
    this.city,
    required this.status,
    this.color,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Supplier.fromJson(Map<String, dynamic> json) => Supplier(
        id: json['id'],
        name: json['name'],
        icon: json['icon'],
        description: json['description'],
        address: json['address'],
        website: json['website'],
        contactEmail: json['contact_email'],
        contactPhone: json['contact_phone'],
        country: json['country'],
        city: json['city'],
        status: json['status'],
        color: json['color'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'icon': icon,
        'description': description,
        'address': address,
        'website': website,
        'contact_email': contactEmail,
        'contact_phone': contactPhone,
        'country': country,
        'city': city,
        'status': status,
        'color': color,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  Map<String, dynamic> toJsonForSQL() => {
        'id': id,
        'name': name,
        'icon': icon,
        'description': description,
        'address': address,
        'website': website,
        'contact_email': contactEmail,
        'contact_phone': contactPhone,
        'country': country,
        'city': city,
        'status': status ? 1 : 0,
        'color': color,
        'created_at': createdAt.toIso8601String(),
        'updated_at': updatedAt.toIso8601String(),
      };

  @override
  String toString() {
    return 'Supplier{userId: $id, name: $name, icon: $icon, description: $description, address: $address, website: $website, contactEmail: $contactEmail, contactPhone: $contactPhone, country: $country, city: $city, status: $status, color: $color, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
